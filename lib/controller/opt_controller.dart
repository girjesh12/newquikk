import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:newquikk/src/ui/screens/dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OtpController extends ChangeNotifier {
  late SharedPreferences _preferences;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  bool isCodeSent = false;
  late String _verificationId;
  TextEditingController pinEditingController = TextEditingController();
  String? phone;

  void init() {
    pinEditingController.text = '';
  }

  Future<void> onVerifyCode(BuildContext context, String phoneNo) async {
    print('i am verifycode');
    Fluttertoast.showToast(msg: 'Sending verification code');
    phone = phoneNo;
    void verificationDone(PhoneAuthCredential credential) async {
      await _firebaseAuth.signInWithCredential(credential).then((value) async {
        if (value.user != null) {
          print('i auto verify');
          print('i verify--->>>${value.user!.uid}');
          _preferences = await SharedPreferences.getInstance();
          _preferences.setString('uid', value.user!.uid);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => Dashboard(
                  phoneNo: phone!,
                ),
              ),
            );
        } else {
          Fluttertoast.showToast(msg: "Error validating OTP, try again");
        }
      }).catchError((error) {
        print('verify done error' + error);
        Fluttertoast.showToast(msg: '$error');
      });
    }

    void verificationFail(FirebaseAuthException e) {
      print('i am fail' + e.message.toString());
      Fluttertoast.showToast(msg: '${e.message}');
    }

    void codeSent(String verificationId, int? resendToken) async {
      print('i am code Sent');
      Fluttertoast.showToast(msg: 'Verification code send successfully');
      _verificationId = verificationId;
    }

    final PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verificationId) {
      _verificationId = verificationId;
    };

    await _firebaseAuth
        .verifyPhoneNumber(
      phoneNumber: "+91$phoneNo",
      timeout: const Duration(seconds: 60),
      verificationCompleted: verificationDone,
      verificationFailed: verificationFail,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    )
        .catchError((error) {
      print('verifyPhoneNo' + error);
      Fluttertoast.showToast(msg: '$error');
    });
  }

  void onFormSubmitted(BuildContext context) async {
    try {
      AuthCredential _authCredential = PhoneAuthProvider.credential(
          verificationId: _verificationId, smsCode: pinEditingController.text);
      var response = await _firebaseAuth.signInWithCredential(_authCredential);

      if (response.user != null) {
        print('i verify');
        print('i verify---${response.user!.uid}');
        _preferences = await SharedPreferences.getInstance();
        _preferences.setString('uid', response.user!.uid);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => Dashboard(
                phoneNo: phone!,
              ),
            ),
          );
        }
      } on FirebaseAuthException catch (e) {
      print(e.code);
      if (e.code == 'invalid-verification-code') {
        Navigator.pop(context);
        Fluttertoast.showToast(msg: 'Invalid OTP');
      } else if (e.code == 'invalid-verification-id') {
        Navigator.pop(context);
        Fluttertoast.showToast(msg: 'Invalid OTP');
      } else {
        Navigator.pop(context);
        Fluttertoast.showToast(
            msg: 'Something went wrong,please try again later');
      }
    }
  }
}
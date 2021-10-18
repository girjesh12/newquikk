import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newquikk/src/ui/screens/OTPScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController{

  late SharedPreferences _preferences;

  GlobalKey<FormState> _key = GlobalKey<FormState>();
  TextEditingController _phoneNoTED = TextEditingController();

  String? validatePhone(String v) {
    if (v.isEmpty) return 'This field is required';
    if (v.length != 10) return 'Please enter valid phone number';
    return null;
  }

  void onSavePhoneNo(String v) {
    _phoneNoTED.text = v;
  }

  void onSendCodeButtonPressed(BuildContext context) {
    if (_key.currentState!.validate()) {
      _key.currentState!.save();
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
          OTPScreen()), (Route<dynamic> route) => false);

    }
  }

  GlobalKey get getKey {
    return _key;
  }

  TextEditingController get getPhoneTED {
    return _phoneNoTED;
  }



}
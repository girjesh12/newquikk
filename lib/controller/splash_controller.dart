import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newquikk/src/ui/screens/dashboard.dart';
import 'package:newquikk/src/ui/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenController extends ChangeNotifier {
  late SharedPreferences _preferences;

  void init(BuildContext context) {
    checkForLogin(context);
  }

  void checkForLogin(BuildContext context) async {
    _preferences = await SharedPreferences.getInstance();
    String? token = _preferences.getString('token');
    print(token);
    if (token != null) {
      Future.delayed(Duration(seconds: 2)).then((value) =>  Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => Dashboard(),
        ),
      ));
    } else {
      Future.delayed(Duration(seconds: 2)).then(
            (value) => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => Login(),
              ),
            ),
      );
    }
  }
}

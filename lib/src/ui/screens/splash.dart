import 'dart:async';

import 'package:flutter/material.dart';
import 'package:newquikk/res/images.dart';
import 'package:newquikk/src/ui/screens/dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Timer(Duration(milliseconds: 1000), () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? uid = prefs.getString('uid');
      if(uid!=null){
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => Dashboard()),
                (Route<dynamic> route) => false);
      }
      else {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => Login()),
                (Route<dynamic> route) => false);
      }

    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            appLogoContainer(),
            splashText()
          ],
        ),
      ),
    );
  }


  Widget appLogoContainer(){
    return  Container(
      height: 100,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: AppImages.quikkLogo,);
  }

  Widget splashText(){
    return Container(
      // padding: EdgeInsets.only(left:50),
      child: Text(
        'Adding speed to your deliveries',
        style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500
        ),
      ),
    );
  }

}

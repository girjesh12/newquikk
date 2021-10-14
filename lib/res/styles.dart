import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';

import 'colors.dart';
import 'numbers.dart';

class AppStyles {
  /* Gradients */
  static LinearGradient blueBackgroundGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color.fromRGBO(16,40,76, 1.0),
      Color.fromRGBO(16,40,76, 0.9),
      Color.fromRGBO(16,40,76, 0.8),
      Color.fromRGBO(16,40,76, 0.9),
      Color.fromRGBO(16,40,76, 1.0),
    ],
  );

  static LinearGradient cardGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color.fromRGBO(116,140,176, 1.0),
      Color.fromRGBO(96,120,156, 1.0),
      Color.fromRGBO(66,90,116, 1.0),
      Color.fromRGBO(36,60,96, 1.0),
      Color.fromRGBO(16,40,76, 1.0),
    ],
  );

  /* Text styles */
  static const blackBold25 = TextStyle(fontSize: d_25, fontWeight: FontWeight.bold, color: Colors.black);
  static const darkGrayBold24 = TextStyle(color: AppColors.darkGray, fontSize: d_24, fontWeight: FontWeight.bold);
  static const darkGrayBold22 = TextStyle(color: AppColors.darkGray, fontSize: d_22, fontWeight: FontWeight.bold);
  static const darkGrayBold18 = TextStyle(color: AppColors.darkGray, fontSize: d_18, fontWeight: FontWeight.bold);
  static const azureLightBold18 = TextStyle(color: AppColors.azureColor, fontSize: d_18, fontWeight: FontWeight.w700);
  static const mainNormal14 = TextStyle(color: AppColors.mainColor, fontSize: d_14, fontWeight: FontWeight.normal);
  static const whiteNormal15 = TextStyle(color: Colors.white, fontSize: d_15, fontWeight: FontWeight.normal);
  static const whiteLightBold20 = TextStyle(color: Colors.white, fontSize: d_20, fontWeight: FontWeight.w700);
  static const lightBlueGaryBold18 = TextStyle(color: AppColors.lightBlueGrey, fontSize: d_18, fontWeight: FontWeight.bold);
  static const blueGrayNormal16 = TextStyle(color: AppColors.blueGrey, fontSize: d_16, fontWeight: FontWeight.normal);

/* Padding */
  EdgeInsetsGeometry pd_0=const EdgeInsets.all(0.0);
  EdgeInsetsGeometry pd_2=const EdgeInsets.all(2.0);
  EdgeInsetsGeometry pd_3=const EdgeInsets.all(3.0);
  EdgeInsetsGeometry pd_4=const EdgeInsets.all(4.0);
  EdgeInsetsGeometry pd_5=const EdgeInsets.all(5.0);
  static EdgeInsetsGeometry pd8=const EdgeInsets.all(8.0);
  static EdgeInsetsGeometry pd10=const EdgeInsets.all(10.0);
  EdgeInsetsGeometry pd_15=const EdgeInsets.all(15.0);
  EdgeInsetsGeometry pd_18=const EdgeInsets.all(18.0);
  static EdgeInsetsGeometry pd20=const EdgeInsets.all(20.0);
  EdgeInsetsGeometry pd_25=const EdgeInsets.all(25.0);
  EdgeInsetsGeometry pd_30=const EdgeInsets.all(30.0);
  EdgeInsetsGeometry pd_40=const EdgeInsets.all(40.0);
  EdgeInsetsGeometry pd_50=const EdgeInsets.all(50.0);

  static EdgeInsetsGeometry pdl15r15t8b8 = const EdgeInsets.only(left: d_15, right: d_15, top: d_8, bottom: d_8);

  static EdgeInsetsGeometry pdb20 = const EdgeInsets.only(bottom: d_20);

  EdgeInsetsGeometry pd_5_0_5_0 = const EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0);
  EdgeInsetsGeometry pd_0_10_0_10=const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0);
  EdgeInsetsGeometry pd_0_10_10_10=const EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 10.0);
  EdgeInsetsGeometry pd_10_10_0_10=const EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 10.0);
  EdgeInsetsGeometry pd_10_0_10_0=const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0);
  EdgeInsetsGeometry pd_20_0_20_0=const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0);
  EdgeInsetsGeometry pd_30_0_30_0=const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0);
  EdgeInsetsGeometry pd_30_30_30_10=const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 10.0);
  EdgeInsetsGeometry pd_40_40_40_0=const EdgeInsets.fromLTRB(40.0, 40.0, 40.0, 0.0);
  EdgeInsetsGeometry pd_10_22_22_10=const EdgeInsets.fromLTRB(10.0, 22.0, 22.0, 10.0);
  EdgeInsetsGeometry pd_20_20_0_0=const EdgeInsets.fromLTRB(20.0, 20.0, 0.0, 0.0);
  EdgeInsetsGeometry pd_30_10_30_10=const EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0);
  EdgeInsetsGeometry pd_20_10_20_10=const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0);
  EdgeInsetsGeometry pd_20_20_20_10=const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0);
  EdgeInsetsGeometry pd_20_10_0_10=const EdgeInsets.fromLTRB(20.0, 10.0, 0.0, 10.0);
  EdgeInsetsGeometry pd_0_10_20_10=const EdgeInsets.fromLTRB(0.0, 10.0, 20.0, 10.0);
  EdgeInsetsGeometry pd_10_6_10_6=const EdgeInsets.fromLTRB(10.0, 6.0, 10.0, 6.0);
  EdgeInsetsGeometry pd_8Left = const EdgeInsets.only(left: 8.0);
  EdgeInsetsGeometry pd_20Left = const EdgeInsets.only(left: 20.0);
  EdgeInsetsGeometry pd_20_10_30_10=const EdgeInsets.fromLTRB(20.0, 10.0, 30.0, 10.0);
  EdgeInsetsGeometry pd_10_10_40_10=const EdgeInsets.fromLTRB(10.0, 10.0, 40.0, 10.0);
  EdgeInsetsGeometry pd_20_20_20_40=const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 40.0);

/* Margin */
  EdgeInsetsGeometry marg_10=const EdgeInsets.only(left: 10.0);


/* BorderRadius */
  BorderRadius br_20=BorderRadius.circular(20.0);
  BorderRadius br_10=BorderRadius.circular(10.0);
  BorderRadius brAll_4=BorderRadius.all(Radius.circular(4.0));

/* Shape */
  RoundedRectangleBorder btnShape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0),);

  /* Text Field Decoration for Login - SignUp */

  static InputDecoration textFieldDecoration(String text, bool signUp) {
    return InputDecoration(
      hintText: text,
      filled: true,
      fillColor: Colors.white,
      hintStyle: TextStyle(color: AppColors.textFieldHintTextColor,fontWeight: FontWeight.w400,fontSize: d_16),
      focusColor: Colors.white,
      focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white,width: d_2)
      ),
    );
  }

  static void setStatusBarTheme(){
    /* Set the status bar color to the widget */
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: AppColors.mainColor, //top bar color
      statusBarIconBrightness: Brightness.light, //top bar icons
      systemNavigationBarColor: AppColors.mainColor, //bottom bar color
      systemNavigationBarIconBrightness: Brightness.light, //bottom bar icons
    ));
  }

  static void setDeviceOrientationOfApp(){
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  static ThemeData getAppTheme() {
    return ThemeData(
      primaryColor: AppColors.mainColor,
      accentColor: AppColors.mainColor,
      primarySwatch: AppColors.primarySwatch,
      pageTransitionsTheme: PageTransitionsTheme(builders: {
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      }),
    );
  }

  static BoxDecoration whiteColorWithAzureBorderCurve20Decoration = BoxDecoration(
      border: Border.all(color: AppColors.azureColor),
      color: Colors.white, // border color
      borderRadius: BorderRadius.all(Radius.circular(d_20))
  );

  static BoxDecoration whiteWithCurve20Decoration = const BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.all(Radius.circular(d_20)),
  );

  static BoxDecoration userTournamentDataDecoration(int type) => BoxDecoration(
      borderRadius: type==1?BorderRadius.only(topLeft: Radius.circular(d_20), bottomLeft: Radius.circular(d_20))
          :type==3?BorderRadius.only(topRight: Radius.circular(d_20), bottomRight: Radius.circular(d_20))
          :BorderRadius.only(topLeft: Radius.circular(d_0)),
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: type==1?GradientColors.orange.reversed.toList():type==2?GradientColors.purple.reversed.toList():GradientColors.darkPink,
      )
  );

}



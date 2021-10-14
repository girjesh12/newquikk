import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'colors.dart';

class AppImages{

  static Widget gameTvLogo = SvgPicture.asset("assets/images/game_tv_logo.svg",fit: BoxFit.contain, color: AppColors.azureColor,);
  static Image gameTvLogoPng = Image.asset("assets/images/game_tv_logo.png",fit: BoxFit.fitHeight,);
  static Image quikkLogo = Image.asset("asset/logo.png");
  static Image googleIcon = Image.asset("asset/google-logo-9827.png");
  static Image quikkLogoBlack = Image.asset("asset/logoB.png");
  static Image otpPicture = Image.asset("asset/w.png",fit: BoxFit.cover,);
  static Image burger = Image.asset("asset/burger.jpeg",fit: BoxFit.fill,);
  static Image ganesh = Image.asset("asset/ganesh.jpg",fit: BoxFit.fill,);
  static Image cover = Image.asset("asset/image.jpeg",fit: BoxFit.fill,);
  /* circular border for profile image */
  static Widget profileBorder = SvgPicture.asset("assets/images/border.svg", fit: BoxFit.fill);
  static AssetImage profileLogoImage = AssetImage("assets/images/userProfile.png");
}
//Image splash1Image = Image.asset("assets/splash.png",fit: BoxFit.fitHeight,);
//Widget fbImage = SvgPicture.asset("assets/facebook.svg",fit: BoxFit.fill,color:Colors.white,);

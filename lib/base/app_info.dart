import 'dart:io';

class AppInfo {
  static String appVersion = Platform.isIOS?"1.0.0":"1.0.0";
  static const String android = "android";
  static const String iOS = "ios";
  static const bool isProduction = false;
  static const bool isQA = false;
}
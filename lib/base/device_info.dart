import 'package:flutter/cupertino.dart';
import 'package:newquikk/res/numbers.dart';

class DeviceInfo {
  static double height = 0.0;
  static double width = 0.0;

  static void setDeviceInfo(BuildContext context){
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.height;
  }

  static DeviceSize getDeviceSize(){
    if(height>d_850){
      //iPhone 12 pro max
      return DeviceSize.XLARGE;
    } else if(height>d_800){
      //iPhone 12 pro
      return DeviceSize.LARGE;
    } else if(height>d_750){
      //iPhone 8
      return DeviceSize.MEDIUM;
    } else {
      //iPhone SE
      return DeviceSize.SMALL;
    }
  }

  static bool isKeyBoardOpen(BuildContext context){
    if(MediaQuery.of(context).viewInsets.bottom>d_0) return true;
    return false;
  }
}

enum DeviceSize {SMALL, MEDIUM, LARGE, XLARGE}
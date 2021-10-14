import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newquikk/res/colors.dart';
import 'package:newquikk/res/numbers.dart';



class AppBarHelper {
  static Widget commonMaterialAppBarWithDrawer(BuildContext context,String title, {required VoidCallback onLogoutTap}) {
    return AppBar(
      elevation: d_0,
      backgroundColor: Colors.white,
      leading: IconButton(icon: Icon(Icons.menu, color: AppColors.darkGray,), onPressed: (){}),
      title: Container(child: Center(child: Text(title, style: TextStyle(color: AppColors.darkGray, fontWeight: FontWeight.bold, fontSize: d_18),),),),
      centerTitle: true,
      actions: <Widget>[
        IconButton(icon: Icon(Icons.logout, color: AppColors.darkGray,), onPressed: onLogoutTap),
      ],
    );
  }
}
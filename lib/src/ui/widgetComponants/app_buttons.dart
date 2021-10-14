import 'package:flutter/material.dart';
import 'package:newquikk/res/colors.dart';
import 'package:newquikk/res/images.dart';
import 'package:newquikk/res/numbers.dart';

class AppButtonHelper {

  static Widget mainAppButton(BuildContext context, String text, bool active) {
    return Padding(
      padding: const EdgeInsets.only(top: d_20, left: d_20, right: d_20),
      child: Container(
        decoration: BoxDecoration(
          color: active ? AppColors.mainColor : AppColors.inactiveBtnColor,
          borderRadius: BorderRadius.all(Radius.circular(d_10)),
        ),
        child: Container(
          padding: EdgeInsets.all(d_2),
          height: d_50,
          width: MediaQuery.of(context).size.width,
          child: Center(
              child: Text(
                text,
                style: TextStyle(
                    fontSize: d_15,
                    fontWeight: FontWeight.w700,
                    color: active ? Colors.white : Colors.white),
                textAlign: TextAlign.center,
              )),
        ),
      ),
    );
  }

  static Widget fbButton(BuildContext context, String text, bool active) {
    return Padding(
      padding: const EdgeInsets.only(top: d_10, left: d_20, right: d_20),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.fbBtnColor,
          borderRadius: BorderRadius.all(Radius.circular(d_10)),
        ),
        child: Container(
          padding: EdgeInsets.only(left: d_20,right: d_20 ),
          height: d_50,
          width: MediaQuery.of(context).size.width,
          child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.facebook_rounded,color: Colors.white,size: 30,),
                  Text(
                    text,
                    style: TextStyle(
                        fontSize: d_15,
                        fontWeight: FontWeight.w700,
                        color: active ? Colors.white : Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  Container()
                ],
              )),
        ),
      ),
    );
  }

  static Widget googleButton(BuildContext context, String text, bool active) {
    return Padding(
      padding: const EdgeInsets.only(top: d_10, left: d_20, right: d_20),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(d_10)),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(d_10)),
          ),
          child: Container(
            padding: EdgeInsets.only(left: d_20,right: d_20 ),
            height: d_50,
            width: MediaQuery.of(context).size.width,
            child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(height: 30,child: AppImages.googleIcon,),
                    Text(
                      text,
                      style: TextStyle(
                          fontSize: d_15,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff707070)),
                      textAlign: TextAlign.center,
                    ),
                    Container()
                  ],
                )),
          ),
        ),
      ),
    );
  }

}
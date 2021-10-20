import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newquikk/res/colors.dart';
import 'package:newquikk/res/numbers.dart';
import 'package:newquikk/res/styles.dart';

class AppTextFields {

  /* Common text field for email and password */
  static Widget loginTextField(BuildContext context, TextEditingController controller,
      int type,) {
    return Container(
      padding: AppStyles.pd10,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(d_0)),
        border: Border.all(color: Colors.grey),
      ),
      child: Theme(
        data: ThemeData(
          hintColor: Colors.white,
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: TextFormField(
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: d_16,
                      fontWeight: FontWeight.w500),
                  onChanged: (value){
                    // onTextFieldChange();
                  },
                  // obscureText: type==0 || provider.isPassShow ? false : true,
                  autofocus: false,
                  keyboardType: type==0 ? TextInputType.emailAddress : TextInputType.text,
                  controller: controller,
                  textAlign: TextAlign.start,
                  textInputAction: TextInputAction.done,
                  textCapitalization: TextCapitalization.none,
                  cursorColor: AppColors.azureColor,
                  inputFormatters: [
                    type==0 ? FilteringTextInputFormatter.deny(new RegExp(r'[!$#<>?":` ~;[\]\\|=)(*&^%]'))
                        : FilteringTextInputFormatter.deny(new RegExp(r' ')),
                  ],
                  decoration: AppStyles.textFieldDecoration(type==0 ? "Translations.of(context).getUserName"
                      : "Translations.of(context).getPassword", false)),
            ),
             InkWell(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 10.0),
                child: Container(
                  height: d_20,
                  width: d_50,
                  child: Center(
                    child: Icon(
                      Icons.remove_red_eye,
                      color: AppColors.textFieldHintTextColor,
                    ),
                  ),
                )
              ),
            ),
          ],
        ),
      ),
    );
  }


  static Widget commonTextField(BuildContext context, controller, String labelText, String hintText,int type,validator,onSaved){
    return  Padding(
      padding: const EdgeInsets.only(top: d_20, left: d_20, right: d_20),
      child: Container(
          height: d_50,
          child: TextFormField(
            validator: validator,
            controller: controller,
            onSaved: onSaved,
            keyboardType: type==0 ? TextInputType.phone : TextInputType.text,
            inputFormatters: [
              type==1 ? FilteringTextInputFormatter.deny(new RegExp(r'[!$#<>?":` ~;[\]\\|=)(*&^%]'))
                  : FilteringTextInputFormatter.deny(new RegExp(r' ')),
            ],
            decoration: new InputDecoration(
                labelStyle: TextStyle(fontSize: 14.0,color: AppColors.mainColor),
                labelText: labelText,
                hintText: hintText,
                hintStyle: TextStyle(fontSize: 14,color: AppColors.textFieldHintTextColor),
                filled: true,
                fillColor: Colors.white,
                enabledBorder: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(d_10),
                  borderSide: new BorderSide(
                      color: AppColors.mainColor
                  ),
                ),
                focusedBorder: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(d_10),
                    borderSide: new BorderSide(
                        color: AppColors.mainColor
                    )),
                border: OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(d_10),
                    borderSide: BorderSide(
                        color: Colors.black, width: 1.0))),
            style: new TextStyle(color: Colors.black),
          )),
    );
  }

  static Widget commonMobileField(BuildContext context, controller, String labelText, String hintText,int type){
    return  Padding(
      padding: const EdgeInsets.only(top: d_20, left: d_20, right: d_20),
      child: Container(
          height: d_50,
          child: TextFormField(
            controller: controller,
            keyboardType: type==0 ? TextInputType.phone : TextInputType.text,
            inputFormatters: [
              type==1 ? FilteringTextInputFormatter.deny(new RegExp(r'[!$#<>?":` ~;[\]\\|=)(*&^%]'))
                  : FilteringTextInputFormatter.deny(new RegExp(r' ')),
            ],
            decoration: new InputDecoration(
                labelStyle: TextStyle(fontSize: 14.0,color: AppColors.mainColor),
                labelText: labelText,
                hintText: hintText,
                hintStyle: TextStyle(fontSize: 14,color: AppColors.textFieldHintTextColor),
                filled: true,
                fillColor: Colors.white,
                enabledBorder: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(d_10),
                  borderSide: new BorderSide(
                      color: AppColors.mainColor
                  ),
                ),
                focusedBorder: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(d_10),
                    borderSide: new BorderSide(
                        color: AppColors.mainColor
                    )),
                border: OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(d_10),
                    borderSide: BorderSide(
                        color: Colors.black, width: 1.0))),
            style: new TextStyle(color: Colors.black),
          )),
    );
  }

}
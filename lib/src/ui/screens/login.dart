import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:newquikk/res/colors.dart';
import 'package:newquikk/res/images.dart';
import 'package:newquikk/res/numbers.dart';
import 'package:newquikk/res/strings.dart';
import 'package:newquikk/src/ui/screens/OTPScreen.dart';
import 'package:newquikk/src/ui/screens/register.dart';
import 'package:newquikk/src/ui/widgetComponants/app_buttons.dart';
import 'package:newquikk/src/ui/widgetComponants/app_text_fields.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final TextEditingController controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: d_50,),
              Container(
                padding: const EdgeInsets.only(left: d_20),
                height: 120,
                child: AppImages.quikkLogoBlack,
              ),
              SizedBox(height: d_20,),
              welcomeBackText(),
              continueUsingText(),
              SizedBox(height: d_50,),
              loginSignupTextRow(),
              SizedBox(height: d_20,),
              AppTextFields.commonMobileField(context, controller, StringConstants.MOBILE,StringConstants.ENTER_MOBILE,0),
              GestureDetector(
                onTap: (){
                  if(controller.text.isNotEmpty){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => OTPScreen(mobile:controller.text)));
                  }else{
                    Fluttertoast.showToast(msg: StringConstants.ENTER_MOBILE);
                  }

                },
                child: AppButtonHelper.mainAppButton(context,StringConstants.LOGIN, false),
              ),
              SizedBox(height: d_20,),
              socialText(),
              AppButtonHelper.fbButton(context,StringConstants.FACEBOOK, false),
              AppButtonHelper.googleButton(context,StringConstants.GOOGLE, false),
            ],
          ),
        ),
      ),
    );
  }


  Widget loginTextContainer(){
    return   Container(
        width: d_50,
        child: Column(
          children: [
            Text(StringConstants.LOGIN,style: TextStyle(color: AppColors.mainColor,fontSize: d_16,fontWeight: FontWeight.w600),),
            SizedBox(height: d_3,),
            Container(width: d_30,height: d_2,color: AppColors.inactiveBtnColor,)
          ],
        ));
  }

  Widget loginSignupTextRow(){
    return Padding(
      padding: const EdgeInsets.only(left: d_20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          loginTextContainer(),
          SizedBox(width: d_12,),
          GestureDetector(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RegisterScreen()),
              );
            },
              child: Text(StringConstants.SIGNUP,style: TextStyle(color: Colors.black,fontSize: d_16,fontWeight: FontWeight.w600),)),
        ],
      ),
    );
  }

  Widget welcomeBackText(){
    return  Padding(
      padding: const EdgeInsets.only(left: d_20),
      child: Text(StringConstants.WELCOME_TEXT,style: TextStyle(color: AppColors.mainColor,fontSize: d_18,fontWeight: FontWeight.w700),),
    );
  }

  Widget continueUsingText(){
    return Padding(
      padding: const EdgeInsets.only(left: d_20),
      child: Text(StringConstants.CONTINUE_USING_APP,style: TextStyle(color: Colors.grey[700],
          fontSize: d_13,fontWeight: FontWeight.w300),),
    );
  }

  Widget socialText(){
    return Center(
      child: Text(StringConstants.USING_SOCIAL_MEDIA,textAlign: TextAlign.center,style: TextStyle(color: Colors.grey[700],
          fontSize: d_13,fontWeight: FontWeight.w300),),
    );
  }
}

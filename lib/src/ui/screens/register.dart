import 'package:flutter/material.dart';
import 'package:newquikk/res/colors.dart';
import 'package:newquikk/res/images.dart';
import 'package:newquikk/res/numbers.dart';
import 'package:newquikk/res/strings.dart';
import 'package:newquikk/src/ui/screens/login.dart';
import 'package:newquikk/src/ui/widgetComponants/app_buttons.dart';
import 'package:newquikk/src/ui/widgetComponants/app_text_fields.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  final TextEditingController nameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
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
                height: d_120,
                child: AppImages.quikkLogoBlack,
              ),
              SizedBox(height: d_20,),
              welcomeBackText(),
              continueUsingText(),
              SizedBox(height: d_50,),
              loginSignupTextRow(),
              SizedBox(height: d_20,),
              AppTextFields.commonTextField(context, nameController,StringConstants.NAME,StringConstants.ENTER_NAME,1),
              AppTextFields.commonTextField(context, mobileController,StringConstants.MOBILE,StringConstants.ENTER_MOBILE,0),
              AppTextFields.commonTextField(context, emailController,StringConstants.EMAIL,StringConstants.ENTER_EMAIL,1),
              AppButtonHelper.mainAppButton(context,StringConstants.SIGNUP,false),
              SizedBox(height: d_20,),
              socialText(),
              AppButtonHelper.fbButton(context, StringConstants.FACEBOOK, false),
              AppButtonHelper.googleButton(context,StringConstants.GOOGLE, false),
            ],
          ),
        ),
      ),
    );
  }


  Widget signupTextContainer(){
    return   Container(
        width: d_80,
        child: Column(
          children: [
            Text(StringConstants.SIGNUP,style: TextStyle(color: AppColors.mainColor,fontSize: d_18,fontWeight: FontWeight.w600),),
            SizedBox(height: d_3,),
            Container(width: d_65,height: d_2,color: AppColors.inactiveBtnColor,)
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
          GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              },
              child: Text(StringConstants.LOGIN,style: TextStyle(color: Colors.black,fontSize: d_18,fontWeight: FontWeight.w600),)),
          SizedBox(width: d_12,),
          signupTextContainer(),


        ],
      ),
    );
  }

  Widget welcomeBackText(){
    return  Padding(
      padding: const EdgeInsets.only(left: d_20),
      child: Text(StringConstants.WELCOME_TEXT,style: TextStyle(color: Colors.black,fontSize: d_20,fontWeight: FontWeight.w700),),
    );
  }

  Widget continueUsingText(){
    return Padding(
      padding: const EdgeInsets.only(left: d_20),
      child: Text(StringConstants.CONTINUE_USING_APP,style: TextStyle(color: Colors.grey[700],
          fontSize: d_15,fontWeight: FontWeight.w300),),
    );
  }

  Widget socialText(){
    return Padding(
      padding: const EdgeInsets.only(left: d_20),
      child: Center(
        child: Text(StringConstants.USING_SOCIAL_MEDIA,textAlign: TextAlign.center,style: TextStyle(color: Colors.grey[700],
            fontSize: d_15,fontWeight: FontWeight.w300),),
      ),
    );
  }

}

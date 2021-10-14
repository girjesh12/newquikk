import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:newquikk/controller/opt_controller.dart';
import 'package:newquikk/res/colors.dart';
import 'package:newquikk/res/images.dart';
import 'package:newquikk/res/strings.dart';
import 'package:newquikk/src/ui/screens/dashboard.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';
import 'package:provider/provider.dart';

class OTPScreen extends StatefulWidget {
  String? mobile;
  OTPScreen({this.mobile});

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {


  ColorBuilder _solidColor =
  PinListenColorBuilder(Color(0xffF2F8F4), Color(0xffF2F8F4));

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<OtpController>(context, listen: false).onVerifyCode(
      context,
      widget.mobile!,
    );
    Provider.of<OtpController>(context, listen: false).init();
  }

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<OtpController>(context);
    return Scaffold(
      backgroundColor: AppColors.otpBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            otpPictureContainer(),
            otpCard(controller),
            SizedBox(height: 30,),
            continueButton(controller),
          ],
        ),
      ),
    );
  }


 Widget continueButton(OtpController controller){
    return GestureDetector(
      onTap: (){
        controller.onFormSubmitted(context);
      },
      child: Container(
        width: 95,
        decoration: BoxDecoration(
            color: AppColors.mainColor,
            borderRadius: BorderRadius.circular(12.0)
        ),
        child:Padding(
          padding: const EdgeInsets.only(left: 8.0,right: 5.0,top: 3.0, bottom: 3.0),
          child: Row(
            children: [
              Text(StringConstants.CONTINUE,style: TextStyle(color: Colors.white,
                  fontSize: 12,fontWeight: FontWeight.w700),),
              Icon(Icons.play_arrow,color: Colors.white,size: 22,)
            ],
          ),
        ),
      ),
    );
  }

  Widget otpVerificationText(){
    return Padding(
      padding: EdgeInsets.only(left: 20,right: 20,top: 30),
      child: Text(StringConstants.OTP_VERIFICATION,style: TextStyle(color: Color(0xff122A2B),
          fontSize: 18,fontWeight: FontWeight.w600),),
    );
  }

  Widget otpReceiveTextText(){
    return Padding(
      padding: EdgeInsets.only(left: 20,right: 20),
      child: Text(StringConstants.ENTER_OTP_RECEIVE,style: TextStyle(color: Colors.grey,
          fontSize: 12,fontWeight: FontWeight.w400),),
    );
  }

  Widget getMobTextText(){
    return  Padding(
      padding: EdgeInsets.only(left: 20,right: 20),
      child: Text("+91 ${widget.mobile}",style: TextStyle(color: Color(0xff122A2B),
          fontSize: 12,fontWeight: FontWeight.w700),),
    );
  }

  Widget resendOTPButton(OtpController controller){
    return GestureDetector(
      onTap: () async {
        await controller.onVerifyCode(context, widget.mobile!);
        Fluttertoast.showToast(
            msg: StringConstants.CODE_SEND_SUCCESSFULLY);
      },
      child: Container(
        padding: EdgeInsets.only(left: 22,right: 20,bottom: 30),
        child: Row(
          children: [
            Text(StringConstants.RESEND_OTP,style: TextStyle(color: Color(0xff7EC6E6),
                fontSize: 12,fontWeight: FontWeight.w700),),
            Icon(Icons.play_arrow,color: Color(0xff7EC6E6),)
          ],
        ),
      ),
    );
  }

  Widget otpCard(OtpController controller){
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12)
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              otpVerificationText(),
              SizedBox(height: 30,),
              otpReceiveTextText(),
              getMobTextText(),
              SizedBox(height: 20,),
              Container(
                padding: EdgeInsets.only(left: 30,right: 20),
                child: PinInputTextField(
                  pinLength: 6,
                  decoration: BoxLooseDecoration(
                      textStyle: Theme.of(context).textTheme.subtitle2,
                      strokeColorBuilder: PinListenColorBuilder(
                          Color(0xffF2F8F4), Color(0xffF2F8F4)),
                      bgColorBuilder: _solidColor
                  ),
                  controller: controller.pinEditingController,
                  autoFocus: true,
                  textInputAction: TextInputAction.done,
                ),
              ),
              SizedBox(height: 30,),
              resendOTPButton(controller)
            ],
          ),
        ),
      ),
    );
  }

  otpPictureContainer(){
    return Container(
      height: MediaQuery.of(context).size.width-80,
      width: MediaQuery.of(context).size.width,
      child: AppImages.otpPicture,
    );
  }

}

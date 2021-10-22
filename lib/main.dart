import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:newquikk/controller/manage_address_controller.dart';
import 'package:newquikk/src/ui/screens/splash.dart';
import 'package:provider/provider.dart';
import 'controller/homeController.dart';
import 'controller/my_accout_screen_controller.dart';
import 'controller/new_enter_details_controller.dart';
import 'controller/opt_controller.dart';
import 'controller/splash_controller.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
            ChangeNotifierProvider<SplashScreenController>(create: (_) => SplashScreenController()),
            ChangeNotifierProvider<OtpController>(create: (_) => OtpController()),
            ChangeNotifierProvider<NewEnterUserDetailsScreenController>(create: (_) => NewEnterUserDetailsScreenController()),
            ChangeNotifierProvider<HomeController>(create: (_) => HomeController(),),
            ChangeNotifierProvider<MyAccountScreenController>(create: (_) => MyAccountScreenController(),),
            ChangeNotifierProvider<ManageAddressController>(create: (_) => ManageAddressController(),),

        ],
     child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen()
      ),
    );
  }
}

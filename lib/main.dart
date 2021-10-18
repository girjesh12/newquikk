import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:newquikk/src/ui/screens/dashboard.dart';
import 'package:newquikk/src/ui/screens/splash.dart';
import 'package:provider/provider.dart';
import 'controller/homeController.dart';
import 'controller/opt_controller.dart';

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
            ChangeNotifierProvider<OtpController>(create: (_) => OtpController()),
            ChangeNotifierProvider<HomeController>(create: (_) => HomeController(),)

        ],
     child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen()
      ),
    );
  }
}

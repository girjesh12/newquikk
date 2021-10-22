import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:newquikk/controller/bottomNav_controller.dart';
import 'package:newquikk/helper/constants.dart';
import 'package:newquikk/res/colors.dart';
import 'package:newquikk/res/numbers.dart';
import 'package:newquikk/res/strings.dart';
import 'package:provider/provider.dart';
import 'account_screen.dart';
import 'cart_screen.dart';
import 'home.dart';
import 'order_history.dart';

class Dashboard extends StatefulWidget {
  String? phoneNo;
  Dashboard({this.phoneNo});

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  List<Widget> _screens = [
    HomeScreen(),
    CartScreen(),
    OrderHistoryPage(),
    AccountScreen(),
  ];

  int selectedIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<BottomNavController>(context, listen: false).checkForInternet();
  }


  @override
  Widget build(BuildContext context) {
    var bController = Provider.of<BottomNavController>(context);
    return WillPopScope(
      onWillPop: () async {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            content: Text('Do you want to exit?'),
            actions: [
              OutlinedButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Cancel', style: Theme.of(context).textTheme.button!.copyWith(color: Colors.black,),),
              ),
              OutlinedButton(
                onPressed: () => SystemNavigator.pop(),
                child: Text('Exit', style: Theme.of(context).textTheme.button,),
              ),
            ],
          ));
        return false;
      },
      child: Scaffold(
        bottomNavigationBar: Container(
          margin: EdgeInsets.only(left: d_16, right: d_16,bottom: d_16),
          decoration: BoxDecoration(
            color: AppColors.mainColor,
            borderRadius: BorderRadius.circular(d_16),
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            currentIndex: selectedIndex,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey[600],
            onTap: (v) {
              setState(() {
                selectedIndex = v;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: StringConstants.HOME1,
              ),
              BottomNavigationBarItem(
                  icon: Stack(
                    alignment: Alignment.center,
                    children: [
                      Icon(Icons.shopping_cart_rounded),
                      Positioned(
                        right: d_0,
                        top: d_0,
                        child: CircleAvatar(
                          radius: d_6,
                          backgroundColor: Colors.black,
                          child: Center(
                            child: Text("2",
                              style: TextStyle(
                                fontSize: d_8,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  label: StringConstants.CART),
              BottomNavigationBarItem(
                icon: Icon(Icons.local_mall),
                label: StringConstants.ORDER,
              ),
              BottomNavigationBarItem(icon: Icon(Icons.person),
                  label: StringConstants.ACCOUNT),
            ],
          ),
        ),
        body: bController.isConnected?
        _screens[selectedIndex]
            : Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(Constant.KLottieAsset + 'no_internet.json'),
          Text('No internet connection',
            style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.black45, fontWeight: FontWeight.bold,),)
        ],),
      ),
    );
  }
}



import 'package:flutter/material.dart';
import 'package:newquikk/controller/my_accout_screen_controller.dart';
import 'package:newquikk/helper/constants.dart';
import 'package:newquikk/res/colors.dart';
import 'package:newquikk/res/custom_loading.dart';
import 'package:provider/provider.dart';


class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<MyAccountScreenController>(context, listen: false).init();
  }

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<MyAccountScreenController>(context);
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: controller.getLoading
              ? Center(
            child: CustomLoading(),
          )
              : SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 16,
                ),
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.grey.withOpacity(.4),
                  child: Icon(
                    Icons.person_outline,
                    color: Colors.white,
                    size: 64,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  '${controller.getName}',
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 0,
                ),
                Text(
                  '${controller.getEmail}',
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    color: Colors.black38,
                  ),
                ),
                Text(
                  '${controller.getPhone}',
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    color: Colors.black38,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 24),
                  tileColor: Color(0xffcccccc).withOpacity(.25),
                  title: Text(
                    'Coins',
                    style:
                    Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: Colors.black54,
                    ),
                  ),
                  subtitle: Text(
                    'Your available reward coins:',
                    style:
                    Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Color(Constant.KSecondaryColor),
                        border:
                        Border.all(color: Colors.black12, width: 1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: SizedBox(
                        width: 80,
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset('asset/quikk_coin.png'),
                            Text(controller.getAccountReferModel!.coinBalance
                                  .toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                // Divider(
                //   thickness: .5,
                //   // indent: 8,
                //   // endIndent: 8,
                // ),
                ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 16),
                  leading: Icon(
                    Icons.home_outlined,
                    color: AppColors.mainColor,
                  ),
                  title: Text(
                    'Manage Address',
                    style:
                    Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: Colors.black,
                    ),
                  ),
                  // onTap: () =>
                  //     Future.delayed(Duration(milliseconds: 400)).then(
                  //           (value) => pushNewScreen(
                  //         context,
                  //         screen: ManageAddressScreen(),
                  //         withNavBar: false,
                  //         // OPTIONAL VALUE. True by default.
                  //         pageTransitionAnimation:
                  //         PageTransitionAnimation.cupertino,
                  //       ),
                  //     ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 16),
                  leading: Icon(
                    Icons.supervisor_account_outlined,
                    color: AppColors.mainColor,
                  ),
                  title: Text(
                    'Refer & Earn',
                    style:
                    Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: Colors.black,
                    ),
                  ),
                  // onTap: () =>
                  //     Future.delayed(Duration(milliseconds: 400)).then(
                  //           (value) => pushNewScreen(
                  //         context,
                  //         screen: ReferScreen(),
                  //         withNavBar: false,
                  //         // OPTIONAL VALUE. True by default.
                  //         pageTransitionAnimation:
                  //         PageTransitionAnimation.cupertino,
                  //       ),
                  //     ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 16),
                  leading: Icon(
                    Icons.assignment_outlined,
                    color: AppColors.mainColor,
                  ),
                  title: Text(
                    'Terms & Conditions',
                    style:
                    Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: Colors.black,
                    ),
                  ),
                  // onTap: () =>
                  //     Future.delayed(Duration(milliseconds: 400)).then(
                  //           (value) => pushNewScreen(
                  //         context,
                  //         screen: WebViewMobileScreen(
                  //           url: 'https://quikkdelivery.com/mobileterms',
                  //         ),
                  //         withNavBar: false,
                  //       ),
                  //     ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 16),
                  leading: Icon(
                    Icons.loop_outlined,
                    color: AppColors.mainColor,
                  ),
                  title: Text(
                    'Return Policies',
                    style:
                    Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: Colors.black,
                    ),
                  ),
                  // onTap: () =>
                  //     Future.delayed(Duration(milliseconds: 400)).then(
                  //           (value) => pushNewScreen(
                  //         context,
                  //         screen: WebViewMobileScreen(
                  //           url: 'https://quikkdelivery.com/mobilereturns',
                  //         ),
                  //         withNavBar: false,
                  //       ),
                  //     ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 16),
                  leading: Icon(
                    Icons.policy_outlined,
                    color: AppColors.mainColor,
                  ),
                  title: Text(
                    'Privacy',
                    style:
                    Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: Colors.black,
                    ),
                  ),
                  // onTap: () =>
                  //     Future.delayed(Duration(milliseconds: 400)).then(
                  //           (value) => pushNewScreen(
                  //         context,
                  //         screen: WebViewMobileScreen(
                  //           url: 'https://quikkdelivery.com/mobileprivacy',
                  //         ),
                  //         withNavBar: false,
                  //       ),
                  //     ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 16),
                  leading: Icon(
                    Icons.support_agent_outlined,
                    color: AppColors.mainColor,
                  ),
                  title: Text(
                    'Customer Support',
                    style:
                    Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: Colors.black,
                    ),
                  ),
                  // onTap: () =>
                  //     Future.delayed(Duration(milliseconds: 400)).then(
                  //           (value) => pushNewScreen(
                  //         context,
                  //         screen: CustomerChatting(),
                  //         withNavBar: false,
                  //       ),
                  //     ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 16),
                  leading: Icon(
                    Icons.logout_outlined,
                    color: AppColors.mainColor,
                  ),
                  title: Text(
                    'Logout',
                    style:
                    Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: Colors.black,
                    ),
                  ),
                  // onTap: () =>
                  //     Future.delayed(Duration(milliseconds: 400)).then(
                  //           (value) => controller.onLogOutButtonPressed(context),
                  //     ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

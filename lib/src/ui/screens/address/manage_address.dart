import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:newquikk/controller/manage_address_controller.dart';
import 'package:newquikk/helper/constants.dart';
import 'package:newquikk/res/colors.dart';
import 'package:newquikk/res/custom_loading.dart';
import 'package:newquikk/src/ui/widgetComponants/custom_back_button.dart';
import 'package:provider/provider.dart';


class ManageAddressScreen extends StatefulWidget {
  const ManageAddressScreen({Key? key}) : super(key: key);

  @override
  _ManageAddressScreenState createState() => _ManageAddressScreenState();
}

class _ManageAddressScreenState extends State<ManageAddressScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<ManageAddressController>(context, listen: false).init();
  }

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<ManageAddressController>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        elevation: 0,
        leading: CustomBackButton(),
        title: Text(
          'Manage Address',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: controller.loading
          ? CustomLoading()
          : CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: const EdgeInsets.only(top: 20, left: 16,bottom: 5),
                  sliver: SliverToBoxAdapter(
                    child: Text('SAVED ADDRESSES',style: TextStyle(color: AppColors.mainColor),),
                  ),
                ),
                controller.addresses.isEmpty
                    ? SliverToBoxAdapter(
                        child: Container(
                            height: MediaQuery.of(context).size.height * .6,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Lottie.asset(
                                    Constant.KLottieAsset + 'no_order.json'),
                                SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  'No address found',
                                  style: Theme.of(context).textTheme.headline6,
                                )
                              ],
                            )),
                      )
                    : SliverPadding(
                        padding: EdgeInsets.only(top: 8),
                        sliver: SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (_, index) {
                              return Container(
                                color: Colors.white,
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.addresses[index].type!,
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle1!
                                          .copyWith(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      '${controller.addresses[index].completeAddress!} ${controller.addresses[index].location!}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(
                                            color: Colors.black38,
                                          ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(),
                                        Row(
                                          children: [
                                            // TextButton(
                                            //   onPressed: () {},
                                            //   child: Text('EDIT'),
                                            // ),
                                            TextButton(
                                              onPressed: () =>
                                                  controller.deleteAddress(
                                                controller.addresses[index].id
                                                    .toString(),
                                              ),
                                              child: Text('DELETE',style: TextStyle(color: AppColors.mainColor),),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    Divider(
                                      thickness: 2,
                                    )
                                  ],
                                ),
                              );
                            },
                            childCount: controller.addresses.length,
                          ),
                        ),
                      ),
                SliverPadding(
                  padding: EdgeInsets.only(
                    left: 16,
                    right: 16,
                    top: 16,
                  ),
                  sliver: SliverToBoxAdapter(
                    child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: AppColors.mainColor,),
                      child: Text('ADD NEW ADDRESS'),
                      onPressed: () =>
                          controller.onAddAddressButtonPressed(context),
                    ),
                  ),
                )
              ],
            ),
    );
  }
}

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:newquikk/controller/homeController.dart';
import 'package:newquikk/res/colors.dart';
import 'package:newquikk/res/images.dart';
import 'package:newquikk/res/numbers.dart';
import 'package:newquikk/res/strings.dart';
import 'package:newquikk/src/ui/widgetComponants/custom_home_screen_shimmer.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeScreen extends StatefulWidget {


  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  HomeController _controller = HomeController();



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.getCategory();
    _controller.getBanner();
    Provider.of<HomeController>(context, listen: false).init();
  }



  @override
  Widget build(BuildContext context) {
    return _controller.loading
        ? CustomHomeScreenShimmer()
     : Scaffold(
      body: SafeArea(
        child: SmartRefresher(
          controller: _controller.getRefreshController,
          onRefresh: () async {
            _controller.init().then(
                  (value) => _controller.getRefreshController
                  .refreshCompleted(),
            );
          },
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                locationContainer(),
                carouselContainer(),
                SizedBox(height: d_20,),
                headContainer1(),
                SizedBox(height: d_10,),
                categoryContainer(),
                headContainer(),
                marketCardWidget(),

              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget categoryContainer(){
    return Container(
      height: 180,
      child: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 15),
        scrollDirection: Axis.horizontal,
        itemCount: 3,
          itemBuilder: (context,index){
            return Container(
              padding: EdgeInsets.only(left:d_5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child: Container(
                      height: 120,
                      width: 120,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: _controller.categories.length>0?
                          Image(
                            image: NetworkImage(
                                _controller.categories[index].image!
                            ),
                          )
                         :
                          AppImages.burger),

                    ),
                  ),
                  headText(_controller.categories[index].name!,d_12,FontWeight.w600),
                  headText("Noida",d_13,FontWeight.w400),
                ],
              ),
            );
          }),
    );
  }

  Widget carouselContainer(){
    return Container(
      child: CarouselSlider(
        items: _controller.bannerDataList
            .map(
              (i) => ClipRRect(
              child: Image(
                image: NetworkImage(
                i.image!,
              ),
          fit: BoxFit.fill, // use this
        )
          ),
        ).toList(),
        options: CarouselOptions(
          height: d_150,
          aspectRatio: 16 / 9,
          viewportFraction: 1,
          initialPage: 0,
          enableInfiniteScroll: true,
          disableCenter: false,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration:
          Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }

  Widget marketCardWidget(){
    return ListView.builder(
        padding: EdgeInsets.only(top: d_5),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 3,
        itemBuilder: (context,index){
          return Container(
            child: Column(
              children: [
                restaurantCard(),
                Container(
                  padding: EdgeInsets.only(left: d_20, right: d_20, top: d_10, bottom: d_10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      headText("Restaurant WEIL, Delhi",d_16,FontWeight.w700),
                      Container(
                        padding: EdgeInsets.zero,
                        child: Row(
                          children: [
                            Icon(Icons.location_on,color: AppColors.mainColor,size: d_18,),
                            headText("944 W sails Noida, India",d_13,FontWeight.w400),
                          ],
                        ),
                      ),
                      headText("30 Rs. for two person",d_12,FontWeight.w400),

                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:d_20, right: d_20),
                  child: Divider(color: Colors.grey[400],),
                )
              ],
            ),
          );
        });
  }

  Widget locationContainer(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: d_10,vertical: d_10),
      child: Row(
       children: [
        locationCard(),
         searchCard()
       ],
      ),
    );
  }

  Widget locationCard(){
    return  Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12)
      ),
      child: Container(
        height: d_45,
        width: d_45,
        child: Icon(Icons.location_on,color: AppColors.mainColor,),
      ),
    );
  }

  Widget searchCard(){
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12)
      ),
      child: Container(
        padding: EdgeInsets.only(left: d_10, right: d_6),
        height: d_45,
        width: MediaQuery.of(context).size.width-d_100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("9-D Krishna Nagar, Delhi"),
            Icon(Icons.search_rounded,color: AppColors.mainColor,),
          ],
        ),
      ),
    );
  }

  Widget headText(String text,fontSize,fontWeight){
    return Container(
      child: Text(text,style: TextStyle(fontSize: fontSize,fontWeight: fontWeight),),
    );
  }

  Widget restaurantCard(){
    return Container(
      padding: EdgeInsets.only(left: d_20, right: d_20, top: d_10, bottom: d_10),
      height: 200,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(d_10)
      ),
      width: MediaQuery.of(context).size.width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(d_10),
        child: AppImages.cover,
      ),
    );
  }

  Widget headContainer(){
    return Container(
      padding: EdgeInsets.only(left: d_20, right: d_20, top: d_10),
      child: headText(StringConstants.MARKETS_HEAD_TEXT,d_18,FontWeight.w700),
    );
  }

  Widget headContainer1(){
    return Container(
      padding: EdgeInsets.only(left: d_20, right: d_20, top: d_10),
      child: headText("Choose By Category",d_18,FontWeight.w700),
    );
  }

}

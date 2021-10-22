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
import 'market_card.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<HomeController>(context, listen: false).init();
  }

  @override
  Widget build(BuildContext context) {
    var _controller = Provider.of<HomeController>(context);
    return _controller.loading ? SafeArea(
        child: CustomHomeScreenShimmer())
     : Scaffold(
      body: SafeArea(
        child: SmartRefresher(
          controller: _controller.getRefreshController,
          onRefresh: () async {
            _controller.init().then((value) => _controller.getRefreshController.refreshCompleted());
          },
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                locationContainer(_controller),
                carouselContainer(_controller),
                SizedBox(height: d_20,),
                headContainer1(),
                SizedBox(height: d_10,),
                categoryContainer(_controller),
                headContainer(),
                marketCardWidget(_controller),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget categoryContainer(HomeController _controller){
    return Container(
      height: 180,
      child: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 15),
        scrollDirection: Axis.horizontal,
        itemCount: _controller.getCategories.length > 7
            ? 7
            : _controller.getCategories.length,
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

  Widget carouselContainer(HomeController _controller){
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

  Widget marketCardWidget(HomeController _controller){
    return _controller.getShops.isEmpty
        ? Center(
      child: Container(
        height:
        MediaQuery.of(context).size.height * .5,
        child: Center(
          child: Text(
              'No Shops Available in this location'),
        ),
      ),
    )
     : ListView.builder(
        padding: EdgeInsets.only(top: d_5),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: _controller.getShops.length,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.only(
                bottom: 8),
            child: MarketCard( shop: _controller.getShops[index],),
          );
        });
  }

  Widget locationContainer(HomeController controller){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      child: Row(
        children: [
          locationCard(controller),
          searchCard(controller)
        ],
      ),
    );
  }

  Widget locationCard(HomeController controller){
    return  GestureDetector(
      onTap: () => controller.openBottomSheet(context),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12)
        ),
        child: Container(
          height: 45,
          width: 45,
          child: Icon(Icons.location_on,color: AppColors.mainColor,),
        ),
      ),
    );
  }

  Widget searchCard(HomeController controller){
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        padding: EdgeInsets.only(left: 10, right: 6),
        height: 45,
        width: MediaQuery.of(context).size.width*.75,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                controller.address ?? '',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400),
              ),
            ),
            // IconButton(
            //   // onPressed: () => controller.goToSearchScreen(context),
            //   icon:
              Icon(Icons.search_rounded,color: AppColors.mainColor,)

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

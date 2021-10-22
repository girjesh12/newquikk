import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:newquikk/models/market_model.dart';
import 'package:newquikk/res/colors.dart';
import 'package:newquikk/res/numbers.dart';

import 'MarketScreen.dart';

class MarketCard extends StatefulWidget {
  final MarketModel shop;
  const MarketCard({Key? key, required this.shop,}) : super(key: key);

  @override
  _MarketCardState createState() => _MarketCardState();
}

class _MarketCardState extends State<MarketCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () { if (widget.shop.currentStatus == 'Yes') {
          Future.delayed(Duration(milliseconds: 400)).then((value) =>
              Navigator.push(context, MaterialPageRoute(builder: (context) => MarketScreen())));
        } else {
          Fluttertoast.showToast(msg: 'This Market is currently offline');
        } },
      child: widget.shop.currentStatus == "Yes"? mainMarketContainer() :Stack(
        children: [
          ShaderMask(
          shaderCallback: (Rect bounds) {
            return RadialGradient(
              center: Alignment.topLeft,
              radius: 1.0,
              colors: <Color>[
                Colors.grey.withOpacity(.5),
                Colors.grey.withOpacity(.5),
              ],
              tileMode: TileMode.mirror,
            ).createShader(bounds);
            },
            child: mainMarketContainer() ,
          ),
          Positioned(
            right: 8,
            top: 8,
            child: Container(
              padding:
              const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8)),
              child: Text(
                'Offline',
                style: Theme.of(context).textTheme.caption!.copyWith(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

        ],
      )
    );
  }

  Widget mainMarketContainer(){
    return  Container(
      child: Column(
        children: [
          restaurantCard(),
          Container(
            padding: EdgeInsets.only(left: d_20, right: d_20, top: d_10, bottom: d_10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                headText(widget.shop.name!,d_16,FontWeight.w700),
                widget.shop.description!.length>0?
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    headText(widget.shop.description!,d_13,FontWeight.w400),
                    headText('${widget.shop.distance!} kms',d_13,FontWeight.w400),
                  ],
                ):Container(),
                Container(
                  padding: EdgeInsets.zero,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.location_on,color: AppColors.mainColor,size: d_18,),
                      Flexible(child: headText(widget. shop.address!,d_13,FontWeight.w400)),
                    ],
                  ),
                ),
                headText(" 30 Rs. for two person",d_12,FontWeight.w400),

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
        child: Image.network(
          widget.shop.image!,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

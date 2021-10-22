import 'package:flutter/material.dart';
import 'package:newquikk/res/colors.dart';
import 'package:newquikk/res/images.dart';
import 'package:newquikk/res/numbers.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  bool tappedArrow = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomCheckoutContainer(),
      appBar: _appBarWidget(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: d_10, right: d_10, top: d_10,),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             headText("Recent Orders",FontWeight.w700,d_20,Colors.black),
             SizedBox(height: d_20,),
             itemCard(),
           ],
          ),
        ),
      ),
    );
  }

   _appBarWidget(){
    return AppBar(
      centerTitle: true,
      backgroundColor: AppColors.mainColor,
      leading: IconButton(
        onPressed: (){
      if (Navigator.canPop(context)) {
        Navigator.pop(context);
      }
    },
        icon: Icon(Icons.arrow_back_ios,color: Colors.white,),
      ),
      title: Text("CART",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
      actions: [
        IconButton(
          onPressed: (){},
          icon: Icon(Icons.delete,color: Colors.white,),
        )
      ],
    );
  }

  Widget headText(String text,fontWeight,size,color){
    return Text(text,style: TextStyle(fontWeight: fontWeight,fontSize:size,color: color ),);
  }

  Widget itemCard(){
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8)
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: d_10,top: d_10,bottom: d_16),
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: AppImages.burger,
                  ),
                ),
                SizedBox(width: 16,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 16,),
                    headText("Salad Burger",FontWeight.w600,d_15,Colors.black),
                    SizedBox(height: 3,),
                    headText("Full",FontWeight.w500,d_12,Colors.red),
                    SizedBox(height: 3,),
                    headText("Rs. 114.17",FontWeight.w500,d_13,Colors.black54),
                  ],
                ),
              ],
            ),
           Positioned(
             bottom: 10,
             right: 10,
             child:  Row(
             children: [
               Icon(Icons.remove_circle,size: 28,),
               headText(" 3 ",FontWeight.w600,d_16,Colors.black),
               Icon(Icons.add_circle,size: 28,),
             ],
           ),)

          ],
        ),
      ),
    );
  }

  _bottomCheckoutContainer(){
    return Card(
      elevation: 3,
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0,right: 8.0,bottom: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: (){
                 setState(() {
                   tappedArrow=true;
                 });
                },
                  child: Icon(Icons.keyboard_arrow_up_sharp,color: AppColors.mainColor,)),
              tappedArrow? rowText("Subtotal","Rs. 394.24"):Container(),
              tappedArrow?rowText("Delivery charges","free"):Container(),
              tappedArrow?rowText("Tex & charges 1.25/0.0","1.25"):Container(),
              tappedArrow? Divider(color: Colors.grey[300],):Container(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      headText("Total", FontWeight.w500, d_14, Colors.grey),
                      headText("Rs.1013.23", FontWeight.w700, d_18, Colors.black),
                    ],
                  ),
                  Container(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                      color: AppColors.mainColor,
                      borderRadius: BorderRadius.circular(16)
                    ),
                    child:Center(child:
                  headText("Checkout", FontWeight.w700, d_16, Colors.white),),)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget rowText(String text1,String text2){
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          headText(text1, FontWeight.w400, d_13, Colors.grey[400]),
          headText(text2,  FontWeight.w400, d_13, Colors.grey[400]),
        ],
      ),
    );
  }

}

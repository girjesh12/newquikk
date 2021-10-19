import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:newquikk/helper/config.dart';
import 'package:newquikk/models/banner_model.dart';
import 'package:newquikk/models/category_model.dart';
import 'package:newquikk/repository/banner_repo.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:http/http.dart' as http;


class HomeController extends ChangeNotifier {

  bool loading = false;
  HomeRepo _homeRepository = HomeRepo();
  List<BannerData> bannerDataList = [];

  List<CategoryModel> categories = [];

  RefreshController _refreshController =
  RefreshController(initialRefresh: false);


  Future<void> init() async {
    bannerDataList = [];
    categories = [];
    getBanner();
  }

    getBanner()async{
    try{
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        _homeRepository.getBannerRepo().then((data) async {
          if(data!.data!.length>0){
            bannerDataList=data.data!;
            print("GIRISH ====>>>>1$bannerDataList");
          }else {
            print(data.message);
            print("GIRISH ====>>>>2${data.message}");
            Fluttertoast.showToast(msg: data.message.toString());
          }
        },onError: (e) {
          print("GIRISH ====>>>>3");
          Fluttertoast.showToast(msg: "Try Again");
        });
      } else {
          Fluttertoast.showToast(msg: "No Internet Connection.");
      }
    }on SocketException catch (_) {
      Fluttertoast.showToast(msg: "No Internet Connection.");
    }
    notifyListeners();
  }



  Future<List<CategoryModel>> getAllCategoriesRepo() async {
    Uri url = Uri.parse('${AppConfig.KBaseUrl}/api/get-all-categories');
    var response = await http.get(url);
    print('[API CALL TO : getAllCategoriesRepo ]');
    print('[RESPONSE CODE : ${response.statusCode}]');
    print('[RESPONSE BODY : ${response.body}]');
    print('[RESPONSE BODY : ${json.decode(response.body)['data']}');
    if (response.statusCode == 200) {
      List<CategoryModel> categories = [];
      for (Map category in json.decode(response.body)['data']) {
        categories.add(CategoryModel.fromJson(category));
      }
      return categories;
    }
    return [];
  }


  void getCategory() async {
    categories = await getAllCategoriesRepo();
    notifyListeners();
  }

  // bool get isLoading => _isLoading;

  RefreshController get getRefreshController {
    return _refreshController;
  }





}
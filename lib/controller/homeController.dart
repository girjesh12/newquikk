import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:newquikk/helper/config.dart';
import 'package:newquikk/models/banner_model.dart';
import 'package:newquikk/models/category_model.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:http/http.dart' as http;


class HomeController extends ChangeNotifier {

  List<BannerModel> bannerList = [];
  List<CategoryModel> categories = [];

  RefreshController _refreshController =
  RefreshController(initialRefresh: false);


  Future<void> init() async {
    bannerList = [];
    categories = [];
    getBanner();
  }


  Future<List<BannerModel>> getBannerRepo() async {
    Uri url = Uri.parse(AppConfig.KBaseUrl + '/api/get-app-banner');
    var response = await http.get(url);
    print('[API CALL TO : getBannerRepo]');
    print('[RESPONSE CODE : ${response.statusCode}]');
    print('[RESPONSE BODY : ${response.body}]');
    if (response.statusCode == 200) {
      List<BannerModel> banner = [];
      for (Map data in json.decode(response.body)['data']) {
        banner.add(BannerModel.fromJson(data));
      }
      return banner;
    }
    return [];
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


  void getBanner() async {
    bannerList = await getBannerRepo();
    notifyListeners();
  }

  void getCategory() async {
    categories = await getAllCategoriesRepo();
    notifyListeners();
  }

  RefreshController get getRefreshController {
    return _refreshController;
  }





}
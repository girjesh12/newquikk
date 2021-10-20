import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:newquikk/helper/config.dart';
import 'package:newquikk/models/addressmodel.dart';
import 'package:newquikk/models/banner_model.dart';
import 'package:newquikk/models/category_model.dart';
import 'package:newquikk/models/coupon_model.dart';
import 'package:newquikk/models/market_model.dart';

class HomeRepo{


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

  Future<List<AddressModel>> getAddressRepo(String token) async {
    Uri url = Uri.parse(AppConfig.KApiUrl + 'get-address');
    var response = await http.post(url, headers: {
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200) {
      List<AddressModel> addresses = [];
      for (Map data in json.decode(response.body)['data']) {
        addresses.add(AddressModel.fromJson(data));
      }
      return addresses;
    }
    return [];
  }

  Future<List<MarketModel>?> getShopsRepo(
      String latitude, String longitude) async {
    final url = Uri.parse(AppConfig.KApiUrl + 'getShops');
    List<MarketModel> shops = [];
    var response = await http.get(url, headers: {
      "X-FOOD-LAT": "$latitude",
      "X-FOOD-LONG": "$longitude",
      "Accept": "application/json"
    });
    print(response.body);
    if (response.statusCode == 200 &&
        json.decode(response.body)['data']['shops'] != null) {
      for (Map shop in json.decode(response.body)['data']['shops']) {
        shops.add(MarketModel.fromJson(shop));
      }
      return shops;
    } else {
      return null;
    }
  }

  Future<List<CouponModel>> getCouponsRepo(String token) async {
    Uri url = Uri.parse(AppConfig.KBaseUrl + '/api/getcoupons?token=$token');
    var response = await http.get(url, headers: {
      'Authorization': 'Bearer $token',
    });

    print('[API CALL TO : getCouponsRepo]');
    print('[RESPONSE CODE : ${response.statusCode}]');
    print('[RESPONSE BODY : ${response.body}]');
    if (response.statusCode == 200) {
      List<CouponModel> coupons = [];
      for (Map data in json.decode(response.body)['data']) {
        coupons.add(CouponModel.fromJson(data));
      }
      return coupons;
    }
    return [];
  }

}
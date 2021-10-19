import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newquikk/helper/config.dart';
import 'package:newquikk/models/banner_model.dart';

class HomeRepo{


  Future<BannerModel?> getBannerRepo() async {
    Uri url = Uri.parse(AppConfig.KBaseUrl + '/api/get-app-banner');
    try{
      http.Response response = await http.get(url);
      print('[API CALL TO : getBannerRepo]');
      print('[RESPONSE CODE : ${response.statusCode}]');
      print('[RESPONSE BODY : ${response.body}]');
      if (response.statusCode == 200) {
        print(" BannerModel List: " + response.body);
        return BannerModel.fromJson(jsonDecode(response.body));
      } else{
        print("Banner ListData Error ${response.body}");
        return null;
      }
    }catch(e){
      print("Banner ListData Error ${e.toString()}");
      throw Exception(e.toString());
    }
  }

}
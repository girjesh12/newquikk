import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:newquikk/helper/config.dart';
import 'package:newquikk/models/account_refer_model.dart';
import 'package:newquikk/models/registerResponseModel.dart';
import 'package:http/http.dart' as http;
import 'package:newquikk/models/user_model.dart';

class UserRepo{

  Future<RegisterResponseModel?> registrationRepo(UserModel user) async {
    Uri url = Uri.parse(AppConfig.KApiUrl + 'reg');
    var response = await http.post(
      url,
      body: {
        'email': user.email,
        'name': user.username,
        'phone': user.phone,
        'password': user.password,
        'password_confirmation': user.confirmPassword,
        'role': '2',
        'address': user.address,
        'referer_id': user.referCode
      },
    );
    print('[API CALL TO : registrationRepo]');
    print('[RESPONSE CODE : ${response.statusCode}]');
    print('[RESPONSE BODY : ${response.body}]');
    if (response.statusCode == 200) {
      return RegisterResponseModel.fromJson(json.decode(response.body));
    }
    print('[RESPONSE BODY : ${json.decode(response.body)['message']}]');
    Fluttertoast.showToast(msg: json.decode(response.body)['message'].toString());
    return null;
  }

  Future<RegisterResponseModel?> checkIfLoginRepo(
      {String? phone, String? email}) async {
    Uri url = Uri.parse(AppConfig.KApiUrl + 'loginCustomer');
    if (phone != null) {
      var response = await http.post(url, body: {
        'phone': phone,
        'role': '2',
      });
      print('ffffffffffffffff');
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200 &&
          json.decode(response.body)['status'] == 200) {
        return RegisterResponseModel.fromJson(json.decode(response.body));
      }
      return null;
    }
    if (email != null) {
      var response = await http.post(url, body: {
        'email': email,
        'role': '2',
      });
      if (response.statusCode == 200 &&
          json.decode(response.body)['status'] == 200) {
        return RegisterResponseModel.fromJson(json.decode(response.body));
      }
      return null;
    }
  }

  Future<void> addUserLocationToDbRepo({
    required String token,
    required String lat,
    required String lng,
  }) async {
    print(' i ma in af;mkaldfndsnsdfjnsgd');
    Uri url = Uri.parse(AppConfig.KBaseUrl + '/api/get-user-location');
    var response = await http.post(
      url,
      body: {
        'type': '0',
        'lat': lat,
        'lng': lng,
      },
      headers: {'Authorization': 'Bearer $token'},
    );
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      print('success');
    } else {
      print('fails');
    }
  }

  Future<AccountReferModel?> getReferDetailsRepo(String token) async {
    Uri url = Uri.parse('${AppConfig.KBaseUrl}/api/getquikkusermoney');
    var response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return AccountReferModel.fromJson(
        json.decode(response.body),
      );
    }
    return null;
  }

}
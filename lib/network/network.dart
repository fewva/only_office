import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:only_office/models/user.dart';

class Network {

  static String token;
  static String portal;

  static Dio get _dio {
    if (token != null && portal != null) {

      print('DIO NOT NULL');
      print(portal);
      return Dio(BaseOptions(
        headers: {
          'Content-Type': 'application/json',
          'Authorization': token
        },
        responseType: ResponseType.plain,
        baseUrl: 'https://' + portal
      ));
    } else {
      print('DIO NULL');
      return Dio(
        BaseOptions(
          headers: {'Content-Type': 'application/json'},
          responseType: ResponseType.plain
        )
      );
    }
  }

  static Future <Response> login({String portal, String login, String password}) async {

    var data = {
      'userName': login,
      'password': password
    };

    var url = 'https://' + portal + '/api/2.0/authentication';

    final ans = await _dio.post(url, data: data);

    return ans;

  }

  static Future <User> getUser() async {

    final ans = await _dio.get('/api/2.0/people/@self');

    var user = User.fromJson(jsonDecode(ans.data)['response']);
    return user;

  }

  static Future getMySection() async {

    final ans = await _dio.get('/api/2.0/files/@my');
    return jsonDecode(ans.data)['response'];

  }

  static Future getCommonSection() async {

    final ans = await _dio.get('/api/2.0/files/@common');
    return jsonDecode(ans.data)['response'];

  }

  static Future getFolderByID(int id) async {

    final ans = await _dio.get('/api/2.0/files/$id');
    return jsonDecode(ans.data)['response'];

  }



}
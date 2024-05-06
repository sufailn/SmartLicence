import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_license/screens/trafic/traffichome.dart';
import 'package:smart_license/screens/user/home.dart';
import 'package:smart_license/utils/api/profileApi.dart';
import 'package:smart_license/utils/common/snackbar.dart';

String baseUrl = 'http://172.20.10.6:5000';
String loginId = '';
String type = '';
String adhar = '';
// String plan = '';R
List<Map<String, dynamic>> profileDatas = [];

Dio dio = Dio();
Future<void> loginUser(String name, String password, context) async {
  try {
    final response = await dio.post(
      '$baseUrl/logincheck?UserName=$name&Password=$password',
      // data: {"username": name, "password": password},
    );

    print('hello');
    print(response.statusCode);
    print(response.data);

    Map data = response.data;

    print(profileDatas);

    if (response.statusCode == 200) {
      if (data['task'] == 'success') {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('userid', data['loginid'].toString());
        prefs.setString('type', data['type']);
        prefs.setString('adhar', data['ano'] ?? "");
        adhar = await prefs.getString('adhar') ?? '';

        loginId = await prefs.getString('userid') ?? '';
        type = await prefs.getString('type') ?? '';

        profileDatas = await getProfile();

        print(type);
        print('gggg');
        showMySnackBar(context, 'Login Success', Colors.green);
        if (type == 'traffic') {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => TrafficHomeScreen(),
              ));
        } else if (type == 'user') {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => Homescreen(),
              ));
        }
      } else {
        showMySnackBar(
            context, data['reason'] ?? 'failed to login', Colors.red);
      }
      // Successful login
      // print('Login Successful');
      print(response.data); // You can handle the response data here
    } else {
      // Handle other status codes (e.g., 401 for unauthorized)
      print('Login Failed');
      showMySnackBar(context, 'Login Failed', Colors.red);
    }
  } catch (e) {
    // Handle errors
    print('Error: $e');
  }
}

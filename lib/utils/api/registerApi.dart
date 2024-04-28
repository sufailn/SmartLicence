import 'package:dio/dio.dart';

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:smart_license/auth/login.dart';
import 'package:smart_license/utils/api/loginApi.dart';
import 'package:smart_license/utils/common/snackbar.dart';

Future<void> registerUser(username, password, adhar, context) async {
  try {
    // Create Dio instance
    Dio dio = Dio();

    // Define the endpoint for registration
    String registerEndpoint =
        '$baseUrl/generateusernameandpassword?username=$username&password=$password&adhar=$adhar';

    // Create FormData object for multipart request
    // FormData formData = FormData();

    // Add data fields to the FormData object
    // formData.fields
    //     .addAll(data.entries.map((entry) => MapEntry(entry.key, entry.value)));

    // Add image file to the FormData object
    // if (img != null) {
    //   String fileName = img.path.split('/').last; // Extract filename from path
    //   formData.files.add(MapEntry(
    //       'photo', MultipartFile.fromFileSync(img.path, filename: fileName)));
    // }

    // Make POST request using Dio
    Response response = await dio.post(
      registerEndpoint,
    );
    print(response.statusCode);
    // Check the response status
    if (response.statusCode == 200) {
      if (response.data['task'] == 'success') {
        print('Registration Successful');
        showMySnackBar(context, 'Registration Successful', Colors.green);
        navigationreplace(context, Login());
        print(response.data);
      } else {
        showMySnackBar(context, response.data['task'], Colors.red);
      }
      // Successful registration
      // You can handle the response data here
    } else {
      // Handle other status codes
      print('Registration Failed');
      showMySnackBar(context, 'Registration Failed', Colors.red);
    }
  } catch (e) {
    // Handle errors
    print('Error: $e');
  }
}

// get user datas for reg

Future<List<Map<String, dynamic>>> getUsedatas(adhaar, context) async {
  print(loginId);
  try {
    Dio dio = Dio();

    // Define the URL endpoint

    // String trainerUrl = '$baseUrl/trainer/trainerregistration/$loginId';

    String url = '$baseUrl/adharbaseduserview?adhar=$adhaar';
    // Make GET request using Dio
    Response response = await dio.get(url);

    // Check the response status
    if (response.statusCode == 200) {
      // Successful response
      List<dynamic> responseData = response.data;

      // Convert list<dynamic> to List<Map<String, dynamic>>
      List<Map<String, dynamic>> dataList =
          responseData.map((item) => item as Map<String, dynamic>).toList();
      print(dataList);
      print(dataList);
      return dataList;
    } else {
      showMySnackBar(context, 'failed to load data', Colors.red);
      // Handle other status codes
      throw Exception('Failed to fetch  trainers');
    }
  } catch (e) {
    showMySnackBar(context, 'failed to load data', Colors.red);
    // Handle errors
    print('Error: $e');
    throw Exception('Failed to load data');
  }
}

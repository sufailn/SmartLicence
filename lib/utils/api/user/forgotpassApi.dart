import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:smart_license/auth/login.dart';
import 'package:smart_license/auth/otpScreen.dart';
import 'package:smart_license/utils/api/loginApi.dart';
import 'package:smart_license/utils/common/snackbar.dart';

Future<void> sendOtp(email, context) async {
  try {
    Dio dio = Dio();

    // Define the URL endpoint
    // String userUrl = '$baseUrl/client/clientregistration/$loginId';
    String trainerUrl = '$baseUrl/forgot_password?email=$email';

    String url = trainerUrl;
    // Make GET request using Dio
    Response response = await dio.get(url);

    // Check the response status
    if (response.statusCode == 200) {
      print(response.data);
      showMySnackBar(context, 'email send to $email', Colors.green);
      navigation(
          context,
          OtpSctreen(
            email: email,
          ));
      // Successful response
      // List<dynamic> responseData = response.data;

      // // Convert list<dynamic> to List<Map<String, dynamic>>
      // List<Map<String, dynamic>> dataList =
      //     responseData.map((item) => item as Map<String, dynamic>).toList();
      // print(dataList);
      // print(dataList);
    } else {
      // Handle other status codes
      throw Exception('Failed to send');
    }
  } catch (e) {
    // Handle errors
    print('Error: $e');
    throw Exception('Failed to load data');
  }
}

Future<void> senNewpass(email, otp, pass, context) async {
  try {
    Dio dio = Dio();

    // Define the URL endpoint
    // String userUrl = '$baseUrl/client/clientregistration/$loginId';
    String trainerUrl =
        '$baseUrl/checkotp?email=$email&otp=$otp&password=$pass';

    String url = trainerUrl;
    // Make GET request using Dio
    Response response = await dio.get(url);

    // Check the response status
    if (response.statusCode == 200) {
      print(response.data);
      navigation(context, Login());
      showMySnackBar(context, 'password updated', Colors.green);
      // Successful response
      // List<dynamic> responseData = response.data;

      // // Convert list<dynamic> to List<Map<String, dynamic>>
      // List<Map<String, dynamic>> dataList =
      //     responseData.map((item) => item as Map<String, dynamic>).toList();
      // print(dataList);
      // print(dataList);
    } else {
      showMySnackBar(context, 'failed to update', Colors.red);
      // Handle other status codes
      throw Exception('Failed to send');
    }
  } catch (e) {
    // Handle errors
    print('Error: $e');
    throw Exception('Failed to load data');
  }
}

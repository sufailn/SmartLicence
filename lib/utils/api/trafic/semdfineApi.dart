import 'package:dio/dio.dart';

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:smart_license/auth/login.dart';
import 'package:smart_license/screens/trafic/searchvechicle.dart';
import 'package:smart_license/utils/api/loginApi.dart';
import 'package:smart_license/utils/common/snackbar.dart';

Future<void> sendFineApi(Map<String, dynamic> data, img, context) async {
  try {
    // Create Dio instance
    Dio dio = Dio();

    // Define the endpoint for registration
    String registerEndpoint = '$baseUrl/insertfine';

    // Create FormData object for multipart request
    FormData formData = FormData();

    // Add data fields to the FormData object
    formData.fields
        .addAll(data.entries.map((entry) => MapEntry(entry.key, entry.value)));

    // Add image file to the FormData object
    if (img != null) {
      String fileName = img.path.split('/').last; // Extract filename from path
      formData.files.add(MapEntry(
          'Photo', MultipartFile.fromFileSync(img.path, filename: fileName)));
    }

    // Make POST request using Dio
    Response response = await dio.post(registerEndpoint, data: formData);
    print(response.statusCode);
    // Check the response status
    if (response.statusCode == 200) {
      // Successful registration
      print('send Successful');
      showMySnackBar(context, 'fine send Successful', Colors.green);
      navigationreplace(context, Searchvechicle());
      print(response.data); // You can handle the response data here
    } else {
      // Handle other status codes
      print('sending Failed');
      showMySnackBar(context, 'sending Failed', Colors.red);
    }
  } catch (e) {
    // Handle errors
    print('Error: $e');
  }
}

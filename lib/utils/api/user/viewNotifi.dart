import 'package:dio/dio.dart';
import 'package:smart_license/utils/api/loginApi.dart';

Future<List<Map<String, dynamic>>> getNotifivcation(Vno) async {
  print(loginId);
  try {
    Dio dio = Dio();

    // Define the URL endpoint
    // String userUrl = '$baseUrl/client/clientregistration/$loginId';
    String trainerUrl = '$baseUrl/viewnotification?vehicleno=$Vno';

    String url = trainerUrl;
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
      // Handle other status codes
      throw Exception('Failed to fetch  lisence');
    }
  } catch (e) {
    // Handle errors
    print('Error: $e');
    throw Exception('Failed to load data');
  }
}

Future<void> acceptrequest(Vno) async {
  print(loginId);
  try {
    Dio dio = Dio();

    // Define the URL endpoint
    // String userUrl = '$baseUrl/client/clientregistration/$loginId';
    String trainerUrl = '$baseUrl/ownerallow?vehiclenum=$Vno';

    String url = trainerUrl;
    // Make GET request using Dio
    Response response = await dio.get(url);

    // Check the response status
    if (response.statusCode == 200) {
      print(response.data);
      // Successful response
      // List<dynamic> responseData = response.data;

      // // Convert list<dynamic> to List<Map<String, dynamic>>
      // List<Map<String, dynamic>> dataList =
      //     responseData.map((item) => item as Map<String, dynamic>).toList();
      // print(dataList);
      // print(dataList);
    } else {
      // Handle other status codes
      throw Exception('Failed to fetch  lisence');
    }
  } catch (e) {
    // Handle errors
    print('Error: $e');
    throw Exception('Failed to load data');
  }
}

Future<void> rejectrequest(Vno) async {
  print(loginId);
  try {
    Dio dio = Dio();

    // Define the URL endpoint
    // String userUrl = '$baseUrl/client/clientregistration/$loginId';
    String trainerUrl = '$baseUrl/ownerreject?vehiclenum=$Vno';

    String url = trainerUrl;
    // Make GET request using Dio
    Response response = await dio.get(url);

    // Check the response status
    if (response.statusCode == 200) {
      print(response.data);
      // Successful response
      // List<dynamic> responseData = response.data;

      // // Convert list<dynamic> to List<Map<String, dynamic>>
      // List<Map<String, dynamic>> dataList =
      //     responseData.map((item) => item as Map<String, dynamic>).toList();
      // print(dataList);
      // print(dataList);
    } else {
      // Handle other status codes
      throw Exception('Failed to fetch  lisence');
    }
  } catch (e) {
    // Handle errors
    print('Error: $e');
    throw Exception('Failed to load data');
  }
}

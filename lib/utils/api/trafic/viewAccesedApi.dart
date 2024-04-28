import 'package:dio/dio.dart';
import 'package:smart_license/utils/api/loginApi.dart';

// user
Future<List<Map<String, dynamic>>> getAccessedList(Vno) async {
  print(loginId);
  try {
    Dio dio = Dio();

    // Define the URL endpoint
    // String userUrl = '$baseUrl/client/clientregistration/$loginId';
    String trainerUrl = '$baseUrl/viewaccessedpeople?vehicleno=$Vno';

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

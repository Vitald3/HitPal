import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../model/api_response_model.dart';
import '../../utils/constant.dart';
import '../../utils/function.dart';

class RegisterNetwork {
  static Future<ApiResponseModel> register(Map<String, dynamic> body) async {
    final Map<String, String> headers = <String, String>{
      'Content-Type': 'application/json'
    };

    final response = await http.post(Uri.parse(registerUrl), headers: headers, body: jsonEncode(body));

    try {
      final json = jsonDecode(response.body);

      if (json['status'] == 'success') {
        return ApiResponseModel(status: true, token: json['data']);
      } else {
        return getApiResponse(ApiResponseModel(code: response.statusCode, status: false, message: json['data']));
      }
    } catch (e) {
      return getApiResponse(ApiResponseModel(code: response.statusCode, status: false, message: e.toString()));
    }
  }
}
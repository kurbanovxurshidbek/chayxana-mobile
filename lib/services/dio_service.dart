import 'dart:convert';
import 'package:dio/dio.dart';

class DioServise {
  static String SERVER_DEVELOPMENT = "https://";

  /// For get Header
  static Map<String, String> getHeaders() {
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
    };
    return headers;
  }

  static String API_LIST = "";
  static String API_CREATE = "";
  static String API_UPDATE = '/';
  static String API_DELETE = '/';

///Dio Get
  static Future<String?> GET(String api,Map<String, dynamic>? params,) async {
    var options = BaseOptions(
      baseUrl: SERVER_DEVELOPMENT,
      headers: getHeaders(),
      connectTimeout: 20000,
      receiveTimeout: 30000,
    );
    Response response = await Dio(options).get(api, queryParameters: params);
    if (response.statusCode == 200) return jsonEncode(response.data);
    return null;
  }

/// Dio Delete
  static Future<String?> DELETE(String api,Map<String, dynamic>? params,) async {
    var options = BaseOptions(
      baseUrl: SERVER_DEVELOPMENT,
      headers: getHeaders(),
      connectTimeout: 20000,
      receiveTimeout: 30000,
    );
    Response response = await Dio(options).delete(api, queryParameters: params);
    if (response.statusCode == 200) return jsonEncode(response.data);
    return null;
  }

///Dio Post
  static Future<String?> POST(String api,Map<String, dynamic>? params,) async {
    var options = BaseOptions(
      baseUrl: SERVER_DEVELOPMENT,
      headers: getHeaders(),
      connectTimeout: 20000,
      receiveTimeout: 30000,
    );
    Response response = await Dio(options).delete(api, queryParameters: params);
    if (response.statusCode == 200) return jsonEncode(response.data);
    return null;
  }

  static Map<String, String> paramEmpty() {
    Map<String, String> map = {};
    return map;
  }

  static Map<String, String> paramsCreate(Object card) {
    Map<String, String> params = new Map();
    params.addAll({});
    return params;
  }

/* static List<Object> parsePostList(String response) {
    List list = jsonDecode(response);
    List<Object> photos =
    List<Object>.from(list.map((x) => Object.fromJson(x)));
    return photos;
  }
*/
}

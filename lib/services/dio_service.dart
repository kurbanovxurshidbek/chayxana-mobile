import 'dart:convert';
import 'package:http/http.dart' as http;

/// This service will change later
class NetworkService {
  static bool isTester = true;

  static String SERVER_DEVELOPMENT = "http://62.109.0.156:8085";
  static String SERVER_PRODUCTION = "http://62.109.0.156:8085";

  /* Dio Apis */
  static String API_CHAYXANALAR = "/api/v1/mobile/chayxana/address";
  static String API_DELETE = "/photos/"; //{id}

  static Map<String, String> get headers {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept-Version': 'v1',
      // 'Accept': 'application/json',
      // 'Authorization': 'Client-ID zYGJr9DhtNKBrx-M5SL9b4QJe3j9kxXlYQtZVB10st8',
      // 'App-OS': Platform.operatingSystem,
      // 'App-Language': LangService.locale.languageCode,
    };
    return headers;
  }

  static String get baseApiUrl {
    if (isTester) return SERVER_DEVELOPMENT;
    return SERVER_PRODUCTION;
  }

  static Uri getUri(
    String api,
  ) {
    return Uri.parse(baseApiUrl + api);
  }

  /* Dio Requests */
  static Future<String?> GET(Uri uri, Map<String, dynamic> params) async {
    http.Response response = await http.get(uri);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }
    return null;
  }

  static Future<String?> POST(Uri uri, Map<String, dynamic> params) async {
    http.Response response = await http.post(uri, body: params);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonEncode(response.body);
    }
    return null;
  }

  static Future<String?> MULTIPART(Uri uri, String path) async {
    var request = http.MultipartRequest("POST", uri);

    request.files
        .add(await http.MultipartFile.fromPath("key_value_from_pai", path));

    var response = await request.send();
    http.Response responsed = await http.Response.fromStream(response);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonEncode(responsed.body);
    }
    return null;
  }

  static Future<String?> PUT(Uri uri, Map<String, dynamic> params) async {
    http.Response response = await http.put(uri, body: params); // http or https
    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonEncode(response.body);
    }
    return null;
  }

  static Future<String?> PATCH(Uri uri, Map<String, dynamic> params) async {
    http.Response response =
        await http.patch(uri, body: params); // http or https
    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonEncode(response.body);
    }
    return null;
  }

  static Future<String?> DELETE(Uri uri, Map<String, dynamic> params) async {
    http.Response response =
        await http.delete(uri, body: params); // http or https
    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonEncode(response.body);
    }
    return null;
  }

  /* Dio Params */
  // static Map<String, dynamic> paramsEmpty() {
  //   Map<String, String> params = {};
  //   return params;
  // }
  //
  // static Map<String, dynamic> paramsPage(int pageNumber) {
  //   Map<String, String> params = {};
  //   params.addAll({"page": pageNumber.toString()});
  //   return params;
  // }
  //
  // static Map<String, dynamic> paramsSearch(String search, int pageNumber) {
  //   Map<String, String> params = {};
  //   params.addAll({"page": pageNumber.toString(), "query": search});
  //   return params;
  // }

  /* Dio body */
  // static Map<String, dynamic> bodyCreate(Object object) {
  //   Map<String, dynamic> body = {};
  //   body.addAll(object.toJson());
  //   return body;
  // }
  //
  // static Map<String, dynamic> paramsUpdate(Object object) {
  //   Map<String, dynamic> body = {};
  //   body.addAll(object.toJson());
  //   return body;
  // }

  /* Dio parsing */
  // static List<Object> parseResponse(String response) {
  //   List json = jsonDecode(response);
  //   List<Object> objects = List<Object>.from(json.map((x) => Object.fromJson(x)));
  //   return objects;
  // }

  /// Exception bilan handle qilinadi
}

import 'dart:convert' as json;
import 'package:http/http.dart' as http;

mixin BaseApi {
  Future<http.Response> executeHttpRequest(
      {String method = HttpMethod.GET,
      Map<String, dynamic>? body,
      Map<String, dynamic>? queryParameters}) async {
    Map<String, String> header = {
      'Content-Type': 'application/json; charset=UTF-8',
    };
    Uri uri =
        Uri.http('api.thecatapi.com', '/v1/images/search', queryParameters);
    switch (method) {
      case HttpMethod.DELETE:
        http.Response response = await http.delete(
          uri,
          headers: header,
        );
        return response;
      case HttpMethod.POST:
        http.Response response = await http.post(
          uri,
          body: body == null ? null : json.jsonEncode(body),
          headers: header,
        );
        return response;
      case HttpMethod.PUT:
        http.Response response = await http.put(
          uri,
          body: body == null ? null : json.jsonEncode(body),
          headers: header,
        );
        return response;
      default:
        http.Response response = await http.get(
          uri,
          headers: header,
        );
        return response;
    }
  }
}

class HttpMethod {
  static const String PUT = 'PUT';
  static const String GET = 'GET';
  static const String POST = 'POST';
  static const String DELETE = 'DELETE';
  static const String FILE = 'DELETE';
}

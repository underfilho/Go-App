import 'dart:convert';
import 'package:http/http.dart' as http;

const _baseUrl = 'https://www.jsonkeeper.com/b/1IXK';

class RestClient {
  Map<String, String> get _header => {
        'Content-Type': 'application/json',
      };

  Future<http.Response> get(String endpoint) async {
    final url = _baseUrl;

    return http.get(Uri.parse(url), headers: _header);
  }

  Future<http.Response> post(String endpoint,
      {Map<String, dynamic>? body}) async {
    final url = _baseUrl;

    return http.post(
      Uri.parse(url),
      headers: _header,
      body: jsonEncode(body),
    );
  }
}

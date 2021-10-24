import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiServices {
  Future<String> ajaxGet(Uri url) async {
    Response result = await http.get(url);
    if (result.statusCode != 200) {
      throw new Exception('Network Error');
    }
    String modifiedResponse =
        '{"status":true,"message":"note list","data":${result.body} }';
    return modifiedResponse;
  }

  Future<String> ajaxPost(Uri url, Map data) async {
    Response result = await http.post(url, body: jsonEncode(data));
    if (result.statusCode != 201) {
      throw new Exception('Network Error');
    }
    String modifiedResponse =
        '{"status":true,"message":"note list","data":[${result.body}] }';
    return modifiedResponse;
  }

  Future<String> ajaxPatch() async {
    return '';
  }

  Future<String> ajaxDelete() async {
    return '';
  }
}

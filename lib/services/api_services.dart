import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiServices {
  Future<String> ajaxGet(Uri url) async {
    Response result = await http.get(url);
    if (result.statusCode != 200) {
      throw new Exception('Network Error');
    } 
    return result.body;
  }

  Future<String> ajaxPost(Uri url, Map data) async {
    Response result = await http.post(url, body: jsonEncode(data));
    if (result.statusCode != 201) {
      throw new Exception('Network Error');
    }
    return result.body;
  }

  Future<String> ajaxPatch(Uri url, Map data) async {
    Response result = await http.patch(url , body: data);
    if (result.statusCode != 200) {
      throw new Exception('Network Error');
    } 
    return result.body;
  }

  Future<String> ajaxDelete(Uri url) async {
    Response result = await http.delete(url);
    if (result.statusCode != 200) {
      throw new Exception('Network Error');
    } 
    return result.body;
  }
}

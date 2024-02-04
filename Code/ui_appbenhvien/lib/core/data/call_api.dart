// ignore_for_file: non_constant_identifier_names, avoid_print


import 'package:http/http.dart' as http;

class APIService {
  static const int timeOutDuration = 35;
  static String GetUrl() => 'http://192.168.1.10:1337/api/';

  Future<dynamic> GetRequest(String url, [String authorization = '']) async {
    var headers = {"Authorization": 'Bearer $authorization'};
    
    // Gọi API GET
    var uri = Uri.parse(url);
   var response = await http
          .get(uri,headers: headers)
          .timeout(const Duration(seconds: timeOutDuration), onTimeout: () {
        return Future.error("Timeout occurred");
      });
      return response.body;
  }

  Future<dynamic> PostRequest(String url, dynamic payloadObj, {String authorization = ''}) async {
    // Gọi API POST
    authorization= '';
    var headers = {'Content-Type': 'application/json','Authorization':"Bearer $authorization"};
    var uri = Uri.parse(url);
    try {
      var response = await http
          .post(uri, headers: headers, body: payloadObj)
          .timeout(const Duration(seconds: timeOutDuration), onTimeout: () {
        return Future.error("Timeout occurred");
      });
      return response.body;
    } catch (e) {
      //throw e;
      print(e);
      //throw ExceptionHandlers().getExceptionString(e);
    }
  }

  Future<dynamic> PutRequest(String url, dynamic payloadObj, {String authorization = ''}) async {
    // Gọi API Put
    authorization= '';
    var headers = {'Content-Type': 'application/json','Authorization': authorization};
    var uri = Uri.parse(url);
    try {
      var response = await http
          .put(uri, headers: headers, body: payloadObj)
          .timeout(const Duration(seconds: timeOutDuration), onTimeout: () {
        return Future.error("Timeout occurred");
      });
      return response.body;
    } catch (e) {
      //throw e;
      print(e);
    }
  }

  Future<dynamic> DeleteRequest(String url, {String authorization = ''}) async {
    authorization= '';
    var headers = {'Authorization': authorization};
    // Gọi API Delete
    var uri = Uri.parse(url);
    try {
      var response = await http
          .delete(uri, headers: headers)
          .timeout(const Duration(seconds: timeOutDuration), onTimeout: () {
        return Future.error("Timeout occurred");
      });
      print(response);
      return response.body;
    } catch (e) {
      //throw e;
      print(e);
    }
  }

  Future<dynamic> getWithCookies(String url, String authorization) async {
    authorization= '';
    var headers = {'Authorization': authorization};

    var response = await http.get(Uri.parse(url), headers: headers);

    return response.body;
  }
}

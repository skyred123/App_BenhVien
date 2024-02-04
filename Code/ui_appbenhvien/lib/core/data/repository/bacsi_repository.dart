// ignore_for_file: non_constant_identifier_names, avoid_print, avoid_renaming_method_parameters

import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:ui_appbenhvien/core/data/call_api.dart';
import 'package:ui_appbenhvien/core/data/models/bac_si.dart';

abstract class BacSiRepository {
  Future<dynamic> GetBacSi(String id, String? jwt);
  Future<dynamic> GetsBacSi(String? jwt);
  Future<dynamic> PostBacSi(Map<String, dynamic> data, String? jwt);
  Future<dynamic> PutBacSi(String id, String? jwt,dynamic data);
  Future<dynamic> DeleteBacSi(String id, String? jwt);
}

class BacSiRepo extends BacSiRepository {
  late String _url;
  BacSiRepo() {
    if (kIsWeb) {
      _url = 'http://localhost:1337/api/ho-so-bac-sis';
    } else {
      _url = '${APIService.GetUrl()}ho-so-bac-sis';
    }
  }

  @override
  Future<BacSi?> GetBacSi(String id, String? jwt) async {
    final response =
        jsonDecode(await APIService().GetRequest('$_url/$id?populate=*', jwt!));
    if (response['data'] != null) {
      return BacSi.fromMap(response['data']);
    } else {
      return null;
    }
  }

  @override
  Future<List<BacSi>> GetsBacSi(String? jwt) async {
    final response =
        jsonDecode(await APIService().GetRequest('$_url?populate=*', jwt!));
    if (response['data'] != null) {
      List<BacSi> list = [];
      for (dynamic item in response['data']) {
        //print(item);
        list.add(BacSi.fromMap(item));
      }
      return list;
    } else {
      return [];
    }
  }

  @override
  Future<dynamic> PostBacSi(Map<String, dynamic> data, String? jwt) async {
    final response =
        await APIService().PostRequest(_url, jsonEncode(data),authorization: jwt!);
    return response;
  }

  @override
  Future<dynamic> PutBacSi(String id, String? jwt,dynamic data) async {
    var value =
        await APIService().PutRequest('$_url/$id', jsonEncode(data),authorization: jwt!);
    return value;
  }

  @override
  Future<dynamic> DeleteBacSi(String id, String? jwt) async {
    var value = await APIService().DeleteRequest('$_url/$id',authorization: jwt! );
    return value;
  }
}

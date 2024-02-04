// ignore_for_file: non_constant_identifier_names, avoid_print, avoid_renaming_method_parameters, camel_case_types

import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:ui_appbenhvien/core/data/call_api.dart';
import 'package:ui_appbenhvien/core/data/models/thoi_gian_kham.dart';

abstract class ThoiGian_KhamRepository {
  Future<dynamic> GetThoiGian_Kham(String id, String? jwt);
  Future<dynamic> GetsThoiGian_Kham(String? jwt);
  Future<dynamic> PostThoiGian_Kham(Map<String, dynamic> data, String? jwt);
  Future<dynamic> PutThoiGian_Kham(String id, String? jwt,dynamic data);
  Future<dynamic> DeleteThoiGian_Kham(String id, String? jwt);
}

class ThoiGian_KhamRepo extends ThoiGian_KhamRepository {
  late String _url;
  ThoiGian_KhamRepo() {
    if (kIsWeb) {
      _url = 'http://localhost:1337/api/thoi-gian-khams';
    } else {
      _url = '${APIService.GetUrl()}thoi-gian-khams';
    }
  }

  @override
  Future<ThoiGian_Kham?> GetThoiGian_Kham(String id, String? jwt) async {
    final response =
        jsonDecode(await APIService().GetRequest('$_url/$id?populate=*', jwt!));
    if (response['data'] != null) {
      return ThoiGian_Kham.fromMap(response['data']);
    } else {
      return null;
    }
  }

  @override
  Future<List<ThoiGian_Kham>> GetsThoiGian_Kham(String? jwt) async {
    final response =
        jsonDecode(await APIService().GetRequest('$_url?populate=*', jwt!));
    if (response['data'] != null) {
      List<ThoiGian_Kham> list = [];
      for (dynamic item in response['data']) {
        //print(item);
        list.add(ThoiGian_Kham.fromMap(item));
      }
      return list;
    } else {
      return [];
    }
  }

  @override
  Future<dynamic> PostThoiGian_Kham(Map<String, dynamic> data, String? jwt) async {
    final response =
        await APIService().PostRequest(_url, jsonEncode(data),authorization: jwt!);
    return response;
  }

  @override
  Future<dynamic> PutThoiGian_Kham(String id, String? jwt,dynamic data) async {
    var value =
        await APIService().PutRequest('$_url/$id', jsonEncode(data),authorization: jwt!);
    return value;
  }

  @override
  Future<dynamic> DeleteThoiGian_Kham(String id, String? jwt) async {
    var value = await APIService().DeleteRequest('$_url/$id',authorization: jwt! );
    return value;
  }
}

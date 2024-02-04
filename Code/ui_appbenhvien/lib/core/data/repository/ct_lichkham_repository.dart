// ignore_for_file: non_constant_identifier_names, avoid_print, avoid_renaming_method_parameters

import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:ui_appbenhvien/core/data/call_api.dart';
import 'package:ui_appbenhvien/core/data/models/bac_si.dart';
import 'package:ui_appbenhvien/core/data/models/ct_lich_kham.dart';

abstract class CT_LichKhamRepository {
  Future<dynamic> GetCT_LichKham(String id, String? jwt);
  Future<dynamic> GetsCT_LichKham(String? jwt);
  Future<dynamic> PostCT_LichKham(Map<String, dynamic> data, String? jwt);
  Future<dynamic> PutCT_LichKham(String id, String? jwt,dynamic data);
  Future<dynamic> DeleteCT_LichKham(String id, String? jwt);
}

class CT_LichKhamRepo extends CT_LichKhamRepository {
  late String _url;
  CT_LichKhamRepo() {
    if (kIsWeb) {
      _url = 'http://localhost:1337/api/ct-lich-khams';
    } else {
      _url = '${APIService.GetUrl()}ct-lich-khams';
    }
  }

  @override
  Future<CT_LichKham?> GetCT_LichKham(String id, String? jwt) async {
    final response =
        jsonDecode(await APIService().GetRequest('$_url/$id?populate=*', jwt!));
    if (response['data'] != null) {
      return CT_LichKham.fromMap(response['data']);
    } else {
      return null;
    }
  }

  @override
  Future<List<CT_LichKham>> GetsCT_LichKham(String? jwt) async {
    final response =
        jsonDecode(await APIService().GetRequest('$_url?populate=*', jwt!));
    if (response['data'] != null) {
      List<CT_LichKham> list = [];
      for (dynamic item in response['data']) {
        //print(item);
        list.add(CT_LichKham.fromMap(item));
      }
      return list;
    } else {
      return [];
    }
  }

  @override
  Future<dynamic> PostCT_LichKham(Map<String, dynamic> data, String? jwt) async {
    final response =
        await APIService().PostRequest(_url, jsonEncode(data),authorization: jwt!);
    return response;
  }

  @override
  Future<dynamic> PutCT_LichKham(String id, String? jwt,dynamic data) async {
    var value =
        await APIService().PutRequest('$_url/$id', jsonEncode(data),authorization: jwt!);
    return value;
  }

  @override
  Future<dynamic> DeleteCT_LichKham(String id, String? jwt) async {
    var value = await APIService().DeleteRequest('$_url/$id',authorization: jwt! );
    return value;
  }
}

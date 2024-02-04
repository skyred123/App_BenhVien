// ignore_for_file: non_constant_identifier_names, avoid_print, avoid_renaming_method_parameters

import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:ui_appbenhvien/core/data/call_api.dart';
import 'package:ui_appbenhvien/core/data/models/bac_si.dart';
import 'package:ui_appbenhvien/core/data/models/thong_bao.dart';

abstract class ThongBaoRepository {
  Future<dynamic> GetThongBao(String id, String? jwt);
  Future<dynamic> GetsThongBao(String? jwt);
  Future<dynamic> PostThongBao(Map<String, dynamic> data, String? jwt);
  Future<dynamic> PutThongBao(String id, String? jwt,dynamic data);
  Future<dynamic> DeleteThongBao(String id, String? jwt);
}

class ThongBaoRepo extends ThongBaoRepository {
  late String _url;
  ThongBaoRepo() {
    if (kIsWeb) {
      _url = 'http://localhost:1337/api/thong-baos';
    } else {
      _url = '${APIService.GetUrl()}thong-baos';
    }
  }

  @override
  Future<ThongBao?> GetThongBao(String id, String? jwt) async {
    final response =
        jsonDecode(await APIService().GetRequest('$_url/$id?populate=*', jwt!));
    if (response['data'] != null) {
      return ThongBao.fromMap(response['data']);
    } else {
      return null;
    }
  }

  @override
  Future<List<ThongBao>> GetsThongBao(String? jwt) async {
    final response =
        jsonDecode(await APIService().GetRequest('$_url?populate=*', jwt!));
    if (response['data'] != null) {
      List<ThongBao> list = [];
      for (dynamic item in response['data']) {
        //print(item);
        list.add(ThongBao.fromMap(item));
      }
      return list;
    } else {
      return [];
    }
  }

  @override
  Future<dynamic> PostThongBao(Map<String, dynamic> data, String? jwt) async {
    final response =
        await APIService().PostRequest(_url, jsonEncode(data),authorization: jwt!);
    return response;
  }

  @override
  Future<dynamic> PutThongBao(String id, String? jwt,dynamic data) async {
    var value =
        await APIService().PutRequest('$_url/$id', jsonEncode(data),authorization: jwt!);
    return value;
  }

  @override
  Future<dynamic> DeleteThongBao(String id, String? jwt) async {
    var value = await APIService().DeleteRequest('$_url/$id',authorization: jwt! );
    return value;
  }
}

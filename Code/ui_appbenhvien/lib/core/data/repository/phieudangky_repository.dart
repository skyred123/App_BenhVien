// ignore_for_file: non_constant_identifier_names, avoid_print, avoid_renaming_method_parameters

import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:ui_appbenhvien/core/data/call_api.dart';
import 'package:ui_appbenhvien/core/data/models/bac_si.dart';
import 'package:ui_appbenhvien/core/data/models/phieu_dang_ky.dart';

abstract class Phieu_DangKyRepository {
  Future<dynamic> GetPhieu_DangKy(String id, String? jwt);
  Future<dynamic> GetsPhieu_DangKy(String? jwt);
  Future<dynamic> PostPhieu_DangKy(Map<String, dynamic> data, String? jwt);
  Future<dynamic> PutPhieu_DangKy(String id, String? jwt,dynamic data);
  Future<dynamic> DeletePhieu_DangKy(String id, String? jwt);
}

class Phieu_DangKyRepo extends Phieu_DangKyRepository {
  late String _url;
  Phieu_DangKyRepo() {
    if (kIsWeb) {
      _url = 'http://localhost:1337/api/phieu-dang-kies';
    } else {
      _url = '${APIService.GetUrl()}phieu-dang-kies';
    }
  }

  @override
  Future<Phieu_DangKy?> GetPhieu_DangKy(String id, String? jwt) async {
    final response =
        jsonDecode(await APIService().GetRequest('$_url/$id?populate=*', jwt!));
    if (response['data'] != null) {
      return Phieu_DangKy.fromMap(response['data']);
    } else {
      return null;
    }
  }

  @override
  Future<List<Phieu_DangKy>> GetsPhieu_DangKy(String? jwt) async {
    final response =
        jsonDecode(await APIService().GetRequest('$_url?populate=*', jwt!));
    if (response['data'] != null) {
      List<Phieu_DangKy> list = [];
      for (dynamic item in response['data']) {
        //print(item);
        list.add(Phieu_DangKy.fromMap(item));
      }
      return list;
    } else {
      return [];
    }
  }

  @override
  Future<dynamic> PostPhieu_DangKy(Map<String, dynamic> data, String? jwt) async {
    final response =
        await APIService().PostRequest(_url, jsonEncode(data),authorization: jwt!);
    return response;
  }

  @override
  Future<dynamic> PutPhieu_DangKy(String id, String? jwt,dynamic data) async {
    var value =
        await APIService().PutRequest('$_url/$id', jsonEncode(data),authorization: jwt!);
    return value;
  }

  @override
  Future<dynamic> DeletePhieu_DangKy(String id, String? jwt) async {
    var value = await APIService().DeleteRequest('$_url/$id',authorization: jwt! );
    return value;
  }
  
  
}

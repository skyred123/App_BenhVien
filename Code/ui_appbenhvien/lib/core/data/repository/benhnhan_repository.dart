// ignore_for_file: non_constant_identifier_names, avoid_print, avoid_renaming_method_parameters

import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:ui_appbenhvien/core/data/call_api.dart';
import 'package:ui_appbenhvien/core/data/models/bac_si.dart';
import 'package:ui_appbenhvien/core/data/models/benhnhan.dart';

abstract class BenhNhanRepository {
  Future<dynamic> GetBenhNhan(String id, String? jwt);
  Future<dynamic> GetsBenhNhan(String? jwt);
  Future<dynamic> PostBenhNhan(Map<String, dynamic> data, String? jwt);
  Future<dynamic> PutBenhNhan(String id, String? jwt,dynamic data);
  Future<dynamic> DeleteBenhNhan(String id, String? jwt);
}

class BenhNhanRepo extends BenhNhanRepository {
  late String _url;
  BenhNhanRepo() {
    if (kIsWeb) {
      _url = 'http://localhost:1337/api/ho-so-benh-nhans';
    } else {
      _url = '${APIService.GetUrl()}ho-so-benh-nhans';
    }
  }

  @override
  Future<BenhNhan?> GetBenhNhan(String id, String? jwt) async {
    final response =
        jsonDecode(await APIService().GetRequest('$_url/$id?populate=*', jwt!));
    if (response['data'] != null) {
      return BenhNhan.fromMap(response['data']);
    } else {
      return null;
    }
  }

  @override
  Future<List<BenhNhan>> GetsBenhNhan(String? jwt) async {
    final response =
        jsonDecode(await APIService().GetRequest('$_url?populate=*', jwt!));
    if (response['data'] != null) {
      List<BenhNhan> list = [];
      for (dynamic item in response['data']) {
        //print(item);
        list.add(BenhNhan.fromMap(item));
      }
      return list;
    } else {
      return [];
    }
  }

  @override
  Future<dynamic> PostBenhNhan(Map<String, dynamic> data, String? jwt) async {
    final response =
        await APIService().PostRequest(_url, jsonEncode(data),authorization: jwt!);
    return response;
  }

  @override
  Future<dynamic> PutBenhNhan(String id, String? jwt,dynamic data) async {
    var value =
        await APIService().PutRequest('$_url/$id', jsonEncode(data),authorization: jwt!);
    return value;
  }

  @override
  Future<dynamic> DeleteBenhNhan(String id, String? jwt) async {
    var value = await APIService().DeleteRequest('$_url/$id',authorization: jwt! );
    return value;
  }
}

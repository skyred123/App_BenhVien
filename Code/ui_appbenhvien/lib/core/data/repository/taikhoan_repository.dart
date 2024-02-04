// ignore_for_file: non_constant_identifier_names, avoid_print, avoid_renaming_method_parameters

import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:ui_appbenhvien/core/data/call_api.dart';
import 'package:ui_appbenhvien/core/data/models/tai_khoan.dart';

abstract class TaiKhoanRepository {
  Future<dynamic> Register(Map<String, dynamic> data);
  Future<dynamic> GetTaiKhoan(String id);
  Future<dynamic> GetsTaiKhoan();
  Future<dynamic> PostTaiKhoan(Map<String, dynamic> data);
  Future<dynamic> PutTaiKhoan(String id,dynamic data);
  Future<dynamic> DeleteTaiKhoan(String id);
}

class TaiKhoanRepo extends TaiKhoanRepository {
  late String _url;
  TaiKhoanRepo() {
    if (kIsWeb) {
      _url = 'http://localhost:1337/api/auth/local';
    } else {
      _url = '${APIService.GetUrl()}auth/local';
    }
  }

  

  @override
  Future<TaiKhoan?> GetTaiKhoan(String id) async {
    final response =
        jsonDecode(await APIService().GetRequest('$_url/$id?populate=*'));
    if (response['data'] != null) {
      return TaiKhoan.fromMap(response['data']);
    } else {
      return null;
    }
  }

  @override
  Future<List<TaiKhoan>> GetsTaiKhoan() async {
    final response =
        jsonDecode(await APIService().GetRequest('$_url?populate=*'));
    if (response['data'] != null) {
      List<TaiKhoan> list = [];
      for (dynamic item in response['data']) {
        //print(item);
        list.add(TaiKhoan.fromMap(item));
      }
      return list;
    } else {
      return [];
    }
  }

  @override
  Future<dynamic> PostTaiKhoan(Map<String, dynamic> data) async {
    final response =
        await APIService().PostRequest(_url, jsonEncode(data));
    return response;
  }

  @override
  Future<dynamic> PutTaiKhoan(String id,dynamic data) async {
    var value =
        await APIService().PutRequest('${APIService.GetUrl()}users/$id', jsonEncode(data));
    return value;
  }

  @override
  Future<dynamic> DeleteTaiKhoan(String id) async {
    var value = await APIService().DeleteRequest('$_url/$id');
    return value;
  }
  
  @override
  Future Register(Map<String, dynamic> data) async {
    var value = await APIService().PostRequest('${APIService.GetUrl()}auth/local/register',jsonEncode(data));
    print(value.toString());
    return value;
  }
}

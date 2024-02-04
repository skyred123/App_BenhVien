// ignore_for_file: non_constant_identifier_names, avoid_print, avoid_renaming_method_parameters

import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:ui_appbenhvien/core/data/call_api.dart';

abstract class RoleRepository {
  Future<dynamic> GetRole(String jwt);
  // Future<dynamic> GetsUser();
  // Future<dynamic> PostUser(Map<String, dynamic> data);
  // Future<dynamic> PutUser(String id,dynamic data);
  // Future<dynamic> DeleteUser(String id);
}

class RoleRepo extends RoleRepository {
  late String _url;
  RoleRepo() {
    if (kIsWeb) {
      _url = 'http://localhost:1337/api/users/me';
    } else {
      _url = '${APIService.GetUrl()}users/me';
    }
  }

  @override
  Future<dynamic> GetRole(String jwt) async {
    final response =
        jsonDecode(await APIService().GetRequest('$_url?populate=*', jwt));
        print(response);
    return response['role']['name'];
  }

  // @override
  // Future<List<User>> GetsUser() async {
  //   final response =
  //       jsonDecode(await APIService().GetRequest('$_url?populate=*'));
  //   if (response['data'] != null) {
  //     List<User> list = [];
  //     for (dynamic item in response['data']) {
  //       //print(item);
  //       list.add(User.fromMap(item));
  //     }
  //     return list;
  //   } else {
  //     return [];
  //   }
  // }

  // @override
  // Future<dynamic> PostUser(Map<String, dynamic> data) async {
  //   final response =
  //       await APIService().PostRequest(_url, jsonEncode(data));
  //   return response;
  // }

  // @override
  // Future<dynamic> PutUser(String id,dynamic data) async {
  //   var value =
  //       await APIService().PutRequest('$_url/$id', jsonEncode(data));
  //   return value;
  // }

  // @override
  // Future<dynamic> DeleteUser(String id) async {
  //   var value = await APIService().DeleteRequest('$_url/$id');
  //   return value;
  // }
}

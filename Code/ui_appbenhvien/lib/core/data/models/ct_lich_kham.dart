// ignore_for_file: camel_case_types, non_constant_identifier_names, unnecessary_getters_setters

import 'package:ui_appbenhvien/core/data/models/bac_si.dart';
import 'package:ui_appbenhvien/core/data/models/phieu_dang_ky.dart';
import 'package:ui_appbenhvien/core/data/models/thoi_gian_kham.dart';

class CT_LichKham {
  int _id;
  DateTime _ngaykham;
  ThoiGian_Kham? _thoiGian_Kham;
  BacSi? _bacsi;
  Phieu_DangKy? _phieu_dangKy;

  

  CT_LichKham({required id, required ngaykham, thoiGian_Kham, bacsi, phieu_DangKy})
      : _id = id,
        _ngaykham = ngaykham,
        _thoiGian_Kham = thoiGian_Kham,
        _bacsi = bacsi,_phieu_dangKy = phieu_DangKy;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'data': {
        'ngaykham': _ngaykham.toString(),
        'thoi_gian_kham': _thoiGian_Kham?.id,
        'ho_so_bac_si': _bacsi?.id
      }
    };
  }

  factory CT_LichKham.fromMap(Map<String, dynamic> map) {
    final attributes = map['attributes'];
    print(map);
    var thoi_gian_kham = null;
    if (attributes['thoi_gian_kham'] != null &&
        attributes['thoi_gian_kham']['data'] != null) {
      ThoiGian_Kham temp =
          ThoiGian_Kham.fromMap(attributes['thoi_gian_kham']['data']);
      temp.trangthai = true;
      thoi_gian_kham = temp;
    }
    var bac_si = null;
    
    if (attributes['ho_so_bac_si'] != null &&
        attributes['ho_so_bac_si']['data'] != null) {
      bac_si = BacSi.fromMap(attributes['ho_so_bac_si']['data']);
    }
    var phieu_dang_ky = null;
    
    if (attributes['phieu_dang_ky'] != null &&
        attributes['phieu_dang_ky']['data'] != null) {
      phieu_dang_ky = Phieu_DangKy.fromMap(attributes['phieu_dang_ky']['data']);
    }
    return CT_LichKham(
        id: map['id'] as int,
        ngaykham: DateTime.parse("${attributes['ngaykham']}"),
        thoiGian_Kham: thoi_gian_kham,
        bacsi: bac_si,
        phieu_DangKy : phieu_dang_ky);
  }

  @override
  String toString() {
    return 'CT_LichKham{id: $id, ngaykham: $_ngaykham,phieu_dang_ky: ${phieu_dangKy.toString()}, thoiGian_Kham: ${_thoiGian_Kham.toString()}}\n';
  }

  DateTime get ngaykham => _ngaykham;

  set ngaykham(DateTime value) {
    _ngaykham = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  ThoiGian_Kham? get thoiGian_Kham => _thoiGian_Kham;

  set thoiGian_Kham(ThoiGian_Kham? value) {
    _thoiGian_Kham = value;
  }

  BacSi? get bacsi => _bacsi;

  set bacsi(BacSi? value) {
    _bacsi = value;
  }
  Phieu_DangKy? get phieu_dangKy => _phieu_dangKy;

  set phieu_dangKy(Phieu_DangKy? value) {
    _phieu_dangKy = value;
  }
}

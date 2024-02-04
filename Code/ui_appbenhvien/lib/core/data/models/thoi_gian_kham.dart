import 'package:ui_appbenhvien/core/data/models/ct_lich_kham.dart';

class ThoiGian_Kham {
  int _id;

  DateTime _GioBatDau;
  DateTime _GioKetThuc;
  List<CT_LichKham>? _ct_lichKhams;

  bool _trangthai = false;

  ThoiGian_Kham(
      {required id, required GioBatDau, required GioKetThuc, ct_lichKhams})
      : _id = id,
        _GioBatDau = GioBatDau,
        _GioKetThuc = GioKetThuc,
        _ct_lichKhams = ct_lichKhams;

  factory ThoiGian_Kham.fromMap(Map<String, dynamic> map) {
    final attributes = map['attributes'];
    List<CT_LichKham> listct_lich_kham = [];
    if (map['attributes']['ct_lich_khams'] != null &&
        map['attributes']['ct_lich_khams']['data'] != null) {
      for (dynamic item in map['attributes']['ct_lich_khams']['data']) {
        listct_lich_kham.add(CT_LichKham.fromMap(item));
      }
    }
    return ThoiGian_Kham(
        id: map['id'] as int,
        GioBatDau: DateTime.parse(
            "${DateTime.now().year}-${DateTime.now().month.toString().padLeft(2, '0')}-${DateTime.now().day.toString().padLeft(2, '0')} ${attributes['GioBatDau']}"),
        GioKetThuc: DateTime.parse(
            "${DateTime.now().year}-${DateTime.now().month.toString().padLeft(2, '0')}-${DateTime.now().day.toString().padLeft(2, '0')} ${attributes['GioKetThuc']}"),
        ct_lichKhams: listct_lich_kham);
  }
  @override
  String toString() {
    return 'ThoiGian_Kham{id: $id, trangthai: $trangthai, GioBatDau: $GioBatDau, GioKetThuc: $GioKetThuc}\n';
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  DateTime get GioBatDau => _GioBatDau;

  set GioBatDau(DateTime value) {
    _GioBatDau = value;
  }

  DateTime get GioKetThuc => _GioKetThuc;

  set GioKetThuc(DateTime value) {
    _GioKetThuc = value;
  }

  bool get trangthai => _trangthai;

  set trangthai(bool value) {
    _trangthai = value;
  }

  List<CT_LichKham>? get ct_lichKham => _ct_lichKhams;

  set ct_lichKham(List<CT_LichKham>? value) {
    _ct_lichKhams = value;
  }
}

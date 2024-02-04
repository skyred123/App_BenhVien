import 'package:ui_appbenhvien/core/data/models/phieu_dang_ky.dart';
import 'package:ui_appbenhvien/core/data/models/tai_khoan.dart';

class BenhNhan {
  int _id;
  String _hoTen;
  bool _gioiTinh;
  DateTime _ngaysinh;
  String _diachi;
  TaiKhoan? _taiKhoan;
  List<Phieu_DangKy>? _phieu_dang_kies;

  BenhNhan(
      {required int id,
      required String hoTen,
      required bool gioiTinh,
      required DateTime ngaysinh,
      required String diachi,
      phieu_dang_kies,
      TaiKhoan? taiKhoan})
      : _id = id,
        _hoTen = hoTen,
        _gioiTinh = gioiTinh,
        _ngaysinh = ngaysinh,
        _diachi = diachi,
        _taiKhoan = taiKhoan,
        _phieu_dang_kies = phieu_dang_kies;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'data': {
        'HoTen': hoTen,
        'GioiTinh': gioiTinh,
        'NgaySinh': ngaysinh.toString(),
        'DiaChi': diachi,
        'users_permissions_user': taiKhoan!.id
      }
    };
  }

  factory BenhNhan.fromMap(Map<String, dynamic> map) {
    final attributes = map['attributes'];

    var taikhoan = null;
    if (attributes['users_permissions_user'] != null &&
        attributes['users_permissions_user']['data'] != null) {
      taikhoan = TaiKhoan.fromMap(attributes['users_permissions_user']['data']);
    }
     List<Phieu_DangKy> phieu_dang_kies = [];
    if (map['attributes']['phieu_dang_kies'] != null && map['attributes']['phieu_dang_kies']['data'] != null){
       for (dynamic item in map['attributes']['phieu_dang_kies']['data']) {
        phieu_dang_kies.add(Phieu_DangKy.fromMap(item));
      }
    }
    return BenhNhan(
      id: map['id'] as int,
      hoTen: attributes['HoTen'],
      gioiTinh: attributes['GioiTinh'],
      ngaysinh: DateTime.parse(attributes['NgaySinh']),
      diachi: attributes['DiaChi'],
      taiKhoan: taikhoan,
      phieu_dang_kies: phieu_dang_kies
      //ct_lich_kham: listct_lich_kham
    );
  }

  @override
  String toString() {
    return 'BenhNhan{id: $id, hoTen: $hoTen, gioiTinh: $gioiTinh, ngaysinh: $ngaysinh, diachi: $diachi, taikhoan: ${taiKhoan.toString()}, phieu_dang_kies: ${phieu_dang_kies.toString()}}\n';
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  String get hoTen => _hoTen;

  set hoTen(String value) {
    _hoTen = value;
  }

  bool get gioiTinh => _gioiTinh;

  set gioiTinh(bool value) {
    _gioiTinh = value;
  }

  DateTime get ngaysinh => _ngaysinh;

  set ngaysinh(DateTime value) {
    _ngaysinh = value;
  }

  String get diachi => _diachi;

  set diachi(String value) {
    _diachi = value;
  }

  TaiKhoan? get taiKhoan => _taiKhoan;

  set taiKhoan(TaiKhoan? value) {
    _taiKhoan = value;
  }

  List<Phieu_DangKy>? get phieu_dang_kies => _phieu_dang_kies;

  set phieu_dang_kies(List<Phieu_DangKy>? value) {
    _phieu_dang_kies = value;
  }
}

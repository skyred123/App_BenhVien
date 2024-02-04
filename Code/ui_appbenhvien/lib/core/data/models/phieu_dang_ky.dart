import 'package:ui_appbenhvien/core/data/models/benhnhan.dart';
import 'package:ui_appbenhvien/core/data/models/ct_lich_kham.dart';

class Phieu_DangKy {
  int _id;
  String _noidung;
  int _trangthai;
  BenhNhan? _benhnhan;
  CT_LichKham? _ct_lichKham;

  Phieu_DangKy(
      {required id,
      required noidung,
      required trangthai,
       benhnhan,
       ct_lichKham})
      : _id = id,
        _noidung = noidung,
        _trangthai = trangthai,
        _benhnhan = benhnhan,
        _ct_lichKham = ct_lichKham;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'data': {
        'NoiDung': _noidung,
        'TrangThai': _trangthai,
        'ho_so_benh_nhan': _benhnhan?.id,
        'ct_lich_kham': ct_lichKham?.id
      }
    };
  }

  factory Phieu_DangKy.fromMap(Map<String, dynamic> map) {
    final attributes = map['attributes'];
    var benhnhan = null;
    if (attributes['ho_so_benh_nhan'] != null &&
        attributes['ho_so_benh_nhan']['data'] != null) {
      benhnhan = BenhNhan.fromMap(attributes['ho_so_benh_nhan']['data']);
    }
    var ct_lichKham = null;
    if (attributes['ct_lich_kham'] != null &&
        attributes['ct_lich_kham']['data'] != null) {
      ct_lichKham = CT_LichKham.fromMap(attributes['ct_lich_kham']['data']);
    }
    return Phieu_DangKy(
      id: map['id'] as int,
      noidung: attributes['NoiDung'],
      trangthai: attributes['TrangThai'],
      benhnhan: benhnhan,
      ct_lichKham: ct_lichKham,
      //ct_lich_kham: listct_lich_kham
    );
  }

  @override
  String toString() {
    return 'Phieu_DangKy{id: $id, noidung: $noidung, trangthai: $trangthai, benhnhan: $benhnhan, ct_lich_kham: ${ct_lichKham.toString()}}';
  }
  // factory BacSi.fromMap(Map<String, dynamic> map) {
  //   final attributes = map['attributes'];

  //   var taikhoan = null;
  //   if (attributes['users_permissions_user'] != null &&
  //       attributes['users_permissions_user']['data'] != null) {
  //     taikhoan = TaiKhoan.fromMap(attributes['users_permissions_user']['data']);
  //   }
  //    List<CT_LichKham> listct_lich_kham = [];
  //   if (map['attributes']['ct_lich_khams'] != null && map['attributes']['ct_lich_khams']['data'] != null){
  //      for (dynamic item in map['attributes']['ct_lich_khams']['data']) {
  //       listct_lich_kham.add(CT_LichKham.fromMap(item));
  //     }
  //   }
  //   return BacSi(
  //     id: map['id'] as int,
  //     hoTen: attributes['HoTen'],
  //     gioiTinh: attributes['GioiTinh'],
  //     kinhNghiem: attributes['KinhNghiem'],
  //     daoTao: attributes['DaoTao'],
  //     taiKhoan: taikhoan,
  //     ct_lich_kham: listct_lich_kham
  //   );
  // }
  int get id => _id;

  set id(int value) {
    _id = value;
  }

  String get noidung => _noidung;

  set noidung(String value) {
    _noidung = value;
  }

  int get trangthai => _trangthai;

  set trangthai(int value) {
    _trangthai = value;
  }

  BenhNhan? get benhnhan => _benhnhan;

  set benhnhan(BenhNhan? value) {
    _benhnhan = value;
  }

  CT_LichKham? get ct_lichKham => _ct_lichKham;

  set ct_lichKham(CT_LichKham? value) {
    _ct_lichKham = value;
  }
}

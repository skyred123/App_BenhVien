import 'package:ui_appbenhvien/core/data/models/ct_lich_kham.dart';
import 'package:ui_appbenhvien/core/data/models/tai_khoan.dart';

class BacSi {
  int _id;
  String _hoTen;
  bool _gioiTinh;
  String _kinhNghiem;
  String _daoTao;
  TaiKhoan? _taiKhoan;
  List<CT_LichKham> _ct_lichkhams;

  BacSi(
      {required int id,
      required String hoTen,
      required bool gioiTinh,
      required String kinhNghiem,
      required String daoTao,
      required List<CT_LichKham> ct_lich_kham,
      TaiKhoan? taiKhoan})
      : _id = id,
        _hoTen = hoTen,
        _gioiTinh = gioiTinh,
        _kinhNghiem = kinhNghiem,
        _daoTao = daoTao,
        _taiKhoan = taiKhoan,
        _ct_lichkhams = ct_lich_kham;

  factory BacSi.fromMap(Map<String, dynamic> map) {
    final attributes = map['attributes'];
    
    var taikhoan = null;
    if (attributes['users_permissions_user'] != null &&
        attributes['users_permissions_user']['data'] != null) {
      taikhoan = TaiKhoan.fromMap(attributes['users_permissions_user']['data']);
    }
     List<CT_LichKham> listct_lich_kham = [];
    if (map['attributes']['ct_lich_khams'] != null && map['attributes']['ct_lich_khams']['data'] != null){
       for (dynamic item in map['attributes']['ct_lich_khams']['data']) {
        listct_lich_kham.add(CT_LichKham.fromMap(item));
      }
    }
    return BacSi(
      id: map['id'] as int,
      hoTen: attributes['HoTen'].toString(),
      gioiTinh: attributes['GioiTinh'],
      kinhNghiem: attributes['KinhNghiem'].toString(),
      daoTao: attributes['DaoTao'].toString(),
      taiKhoan: taikhoan,
      ct_lich_kham: listct_lich_kham
    );
  }

  @override
  String toString() {
    return 'BacSi{id: $id, hoTen: $hoTen, gioiTinh: $gioiTinh, kinhNghiem: $kinhNghiem, daoTao: $daoTao, taiKhoan: $taiKhoan, ct_lich_kham: ${ct_lichkhams.toString()}}}\n';
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

  String get kinhNghiem => _kinhNghiem;

  set kinhNghiem(String value) {
    _kinhNghiem = value;
  }

  String get daoTao => _daoTao;

  set daoTao(String value) {
    _daoTao = value;
  }

  TaiKhoan? get taiKhoan => _taiKhoan;

  set taiKhoan(TaiKhoan? value) {
    _taiKhoan = value;
  }

  List<CT_LichKham> get ct_lichkhams => _ct_lichkhams;

  set ct_lichkhams(List<CT_LichKham> value) {
    _ct_lichkhams = value;
  }
}

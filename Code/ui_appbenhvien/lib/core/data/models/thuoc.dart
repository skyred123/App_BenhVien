// ignore_for_file: non_constant_identifier_names

class Thuoc {
  final String id;
  final String TenThuoc;
  final String TacDung;
  final String LieuDung;
  final String TacDungPhu;
  final String CanhBao;
  final String TuongTacThuoc;
  final String KhanCap;
  final String BaoQuan;

  Thuoc(
      {required this.id,
      required this.TenThuoc,
      required this.TacDung,
      required this.LieuDung,
      required this.TacDungPhu,
      required this.CanhBao,
      required this.TuongTacThuoc,
      required this.KhanCap,
      required this.BaoQuan});

  factory Thuoc.fromMap(Map<String, dynamic> map) {
    final attributes = map['attributes'];
    print(attributes);
    return Thuoc(
      id: map['id'] as String,
      TenThuoc: map['TenThuoc'] as String,
      TacDung: '',
      LieuDung: '',
      TacDungPhu: '',
      CanhBao: '',
      TuongTacThuoc: '',
      KhanCap: '',
      BaoQuan: '',
      // TacDung: map['TacDung'],
      // LieuDung: map['LieuDung'],
      // TacDungPhu: map['TacDungPhu'],
      // CanhBao: map['CanhBao'],
      // TuongTacThuoc: map['TuongTacThuoc'],
      // KhanCap: map['KhanCap'],
      // BaoQuan: map['BaoQuan'],
    );
  }
}

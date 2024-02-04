import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ui_appbenhvien/core/app_export.dart';
import 'package:ui_appbenhvien/core/data/models/bac_si.dart';
import 'package:ui_appbenhvien/core/data/models/ct_lich_kham.dart';
import 'package:ui_appbenhvien/core/data/models/phieu_dang_ky.dart';
import 'package:ui_appbenhvien/core/data/models/thong_bao.dart';
import 'package:ui_appbenhvien/core/data/repository/ThongBao_repository.dart';
import 'package:ui_appbenhvien/core/data/repository/ct_lichkham_repository.dart';
import 'package:ui_appbenhvien/view/videocall/call_page.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class XacNhanKhamPage2 extends StatefulWidget {
  final BacSi bacsi;
  final String role;

  const XacNhanKhamPage2({super.key, required this.bacsi, required this.role});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return XacNhanKhamPageState2();
  }
}

class XacNhanKhamPageState2 extends State<XacNhanKhamPage2> {
  bool loadData = false;
  List<CT_LichKham> ct_lich_khams = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ReloadPage(() {});
  }

  void ReloadPage(Function func) async {
    for (int i = 0; i < widget.bacsi.ct_lichkhams.length; i++) {
      CT_LichKham? ct_lichKham =
          await _ct_lichKham(widget.bacsi.ct_lichkhams[i].id.toString());
      if (ct_lichKham != null && ct_lichKham.phieu_dangKy != null) {
        ct_lich_khams.add(ct_lichKham);
      }
    }
    setState(() {
      func;
      loadData = true;
    });
  }

  Future<CT_LichKham?> _ct_lichKham(String id) async {
    CT_LichKham? ct_lichKham =
        await CT_LichKhamRepo().GetCT_LichKham(id, widget.bacsi.taiKhoan!.jwt);
    return ct_lichKham;
  }

  @override
  Widget build(BuildContext context) {
    if (loadData) {
      //print(widget.benhnhan);
      return Scaffold(
        appBar: AppBar(
          title: const Text("Xác nhận lịch khám",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: AppColors.darkBlue)),
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (var item in ct_lich_khams)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                width: 1, color: Color(0xFFCEE8FA)),
                            borderRadius: BorderRadius.circular(25),
                          )),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 10, bottom: 10, left: 15, right: 15),
                        child: Column(children: [
                          Row(
                            children: [
                              Expanded(
                                  child: Text(
                                      //"đâsdsađá",
                                      "${DateFormat("hh:mm a").format(item.thoiGian_Kham!.GioBatDau)} - \n${DateFormat("hh:MM a").format(item.thoiGian_Kham!.GioKetThuc)}",
                                      textAlign: TextAlign.left,
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontFamily: "Comfortaa"))),
                              Expanded(
                                  child: Text(
                                      //"đâsdsađá",
                                      DateFormat("dd/MM/yyyy")
                                          .format(item.ngaykham),
                                      textAlign: TextAlign.right,
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontFamily: "Comfortaa")))
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            child: Row(
                              children: [
                                Expanded(
                                    child: Text("Bệnh Nhân",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: "Comfortaa"))),
                                Expanded(
                                    child: Text(item.phieu_dangKy!.noidung,
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: "Comfortaa")))
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Padding(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(item.phieu_dangKy!.noidung,
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: "Comfortaa")),
                                ],
                              )),
                          const SizedBox(
                            height: 20,
                          ),
                          TextButton(
                              onPressed: () {
                                CreatedThongbao();
                                XacNhan();
                              },
                              style: TextButton.styleFrom(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  backgroundColor: const Color(0xFFCEE8FA)),
                              child: const SizedBox(
                                width: double.infinity,
                                child: Text(
                                  "Xác nhận",
                                  style: TextStyle(
                                      fontFamily: 'Comfortaa',
                                      fontSize: 18,
                                      color: Colors.black),
                                  textAlign: TextAlign.center,
                                ),
                              )),
                        ]),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      );
    } else {
      return Container();
    }
  }
  // Future<Phieu_DangKy>? _GetPhieuDangKy() async{
  //   return Phieu_DangKy(id: 0, noidung: "noidung", trangthai: "trangthai");
  // }
  //

  void CreatedThongbao() async {
    ThongBao thongBao = ThongBao(
        id: 0,
        tieude: "Bắt đầu gọi",
        noidung: "",
        token: "123456",
        thoigian: DateTime.now(),
        taikhoan: widget.bacsi.taiKhoan);
    var result = await ThongBaoRepo()
        .PostThongBao(thongBao.toMap(), widget.bacsi.taiKhoan!.jwt);
    print(result);
  }

  void XacNhan() {
    if (ZegoUIKitPrebuiltCallMiniOverlayMachine().isMinimizing) {
      /// when the application is minimized (in a minimized state),
      /// disable button clicks to prevent multiple PrebuiltCall components from being created.
      return;
    }
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const CallPage(
              callId: "123456",
            )));
  }
}

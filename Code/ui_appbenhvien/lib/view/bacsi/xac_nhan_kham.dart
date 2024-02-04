import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ui_appbenhvien/core/app_export.dart';
import 'package:ui_appbenhvien/core/data/models/benhnhan.dart';
import 'package:ui_appbenhvien/core/data/models/ct_lich_kham.dart';
import 'package:ui_appbenhvien/core/data/models/phieu_dang_ky.dart';
import 'package:ui_appbenhvien/core/data/models/tai_khoan.dart';
import 'package:ui_appbenhvien/core/data/models/thong_bao.dart';
import 'package:ui_appbenhvien/core/data/repository/ThongBao_repository.dart';
import 'package:ui_appbenhvien/core/data/repository/ct_lichkham_repository.dart';
import 'package:ui_appbenhvien/core/data/repository/phieudangky_repository.dart';
import 'package:ui_appbenhvien/view/videocall/call_page.dart';
import 'package:ui_appbenhvien/view/videocall/constants.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class XacNhanKhamPage extends StatefulWidget {
  final TaiKhoan taiKhoan;
  final String role;

  const XacNhanKhamPage(
      {super.key, required this.taiKhoan, required this.role});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return XacNhanKhamPageState();
  }
}

class XacNhanKhamPageState extends State<XacNhanKhamPage> {
  bool loadData = false;
  List<ThongBao> list_thongbao = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ReloadPage(() {});
  }

  void ReloadPage(Function func) async {
    list_thongbao.clear();
    var r = await ThongBaoRepo().GetsThongBao(widget.taiKhoan.jwt);
    list_thongbao.addAll(r);
    //print(widget.taiKhoan.toString());
    // for (int i = 0; i < widget.benhnhan.phieu_dang_kies!.length; i++) {
    //   CT_LichKham? ct_lichKham = await _ct_lichKham(widget.benhnhan.phieu_dang_kies![i].id.toString());
    //   if(ct_lichKham != null){
    //     ct_lich_khams.add(ct_lichKham);
    //   }
    // }
    setState(() {
      func;
      loadData = true;
    });
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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (var item in list_thongbao)
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
                                    "${DateFormat("hh:mm a").format(item.thoigian)}",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: "Comfortaa"))),
                            Expanded(
                                child: Text(
                                    //"đâsdsađá",
                                    DateFormat("dd/MM/yyyy")
                                        .format(item.thoigian),
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                        fontSize: 20, fontFamily: "Comfortaa")))
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Text("Nội Dung",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: "Comfortaa"))),
                              Expanded(
                                  child: Text(item.tieude,
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: "Comfortaa")))
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextButton(
                            onPressed: () {
                              XacNhan(item.token);
                            },
                            style: TextButton.styleFrom(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                backgroundColor: Color(0xFFCEE8FA)),
                            child: SizedBox(
                              width: double.infinity,
                              child: Text(
                                "Xác nhận",
                                style: const TextStyle(
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
      );
    } else {
      return Container();
    }
  }

  void XacNhan(String id) async {
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

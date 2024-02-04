import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ui_appbenhvien/core/app_export.dart';
import 'package:ui_appbenhvien/core/data/models/bac_si.dart';
import 'package:ui_appbenhvien/core/data/models/benhnhan.dart';
import 'package:ui_appbenhvien/core/data/models/ct_lich_kham.dart';
import 'package:ui_appbenhvien/core/data/models/phieu_dang_ky.dart';
import 'package:ui_appbenhvien/core/data/models/thoi_gian_kham.dart';
import 'package:ui_appbenhvien/core/data/repository/bacsi_repository.dart';
import 'package:ui_appbenhvien/core/data/repository/ct_lichkham_repository.dart';
import 'package:ui_appbenhvien/core/data/repository/phieudangky_repository.dart';

class DatLichDialog extends StatefulWidget {
  final String id;
  final BenhNhan benhnhan;

  const DatLichDialog({super.key, required this.id, required this.benhnhan});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DatLichDialogState();
  }
}

class DatLichDialogState extends State<DatLichDialog> {
  bool loadData = false;
  DateTime date = DateTime.now();
  List<ThoiGian_Kham> thoigiankham = [];
  TextEditingController noidungController = TextEditingController();
  var bacsi = null;
  @override
  void initState() {
    super.initState();
    ReloadPage(() {});
  }

  void ReloadPage(Function func) async {
    BacSi? bs =
        await BacSiRepo().GetBacSi(widget.id, widget.benhnhan.taiKhoan!.jwt);
    List<CT_LichKham> temp = [];
    if (bs != null && bs.ct_lichkhams != null) {
      for (var item in bs.ct_lichkhams) {
        CT_LichKham? ct_lich_kham = await CT_LichKhamRepo()
            .GetCT_LichKham(item.id.toString(), widget.benhnhan.taiKhoan!.jwt);
        if (ct_lich_kham != null && ct_lich_kham.thoiGian_Kham != null) {
          temp.add(ct_lich_kham);
          ct_lich_kham.thoiGian_Kham!.trangthai = false;
          thoigiankham.add(ct_lich_kham.thoiGian_Kham as ThoiGian_Kham);
        }
      }
      bs.ct_lichkhams = temp;
    }
    bacsi = bs;
    setState(() {
      func;
      loadData = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (loadData) {
      BacSi bac_si = bacsi;
      return AlertDialog(
          backgroundColor: Colors.white,
          title: const Text(
            "Đặt lịch",
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          content: Container(
              padding: const EdgeInsets.all(5),
              width: 500,
              child: LayoutBuilder(builder: (context, constraints) {
                return Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ElevatedButton(
                          style: ButtonStyle(
                              padding:
                                  MaterialStateProperty.all<EdgeInsetsGeometry>(
                                const EdgeInsets.all(10.0), // Padding cho nút
                              ),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      20.0), // Độ cong của góc nút
                                ),
                              ),
                              side: MaterialStateProperty.all<BorderSide>(
                                BorderSide(
                                    color: Colors.indigo
                                        .shade900), // Màu sắc của đường biên
                              ),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.blue[100]!)),
                          onPressed: () async {
                            final result = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(3000));
                            setState(() {
                              if (result != null) {
                                date = result;
                              }
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: constraints.maxWidth <= 101
                                ? Container()
                                : Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      SizedBox(
                                        width: constraints.maxWidth <= 101
                                            ? 0
                                            : constraints.maxWidth - 100,
                                        child: Text(
                                          DateFormat("dd/MM/yyy").format(date),
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: Colors.grey.shade700,
                                              fontSize: 16),
                                        ),
                                      ),
                                      const Icon(Icons.calendar_today)
                                    ],
                                  ),
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        cursorColor: Colors.white,
                        //enableInteractiveSelection: false,
                        textAlign: TextAlign.center,
                        controller: noidungController,
                        decoration: InputDecoration(
                            hintText: 'Vui lòng nhập nội dung',
                            filled: true,
                            fillColor: Colors.blue[100],
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Vui lòng chọn giờ.",
                        style:
                            TextStyle(fontSize: 18, color: AppColors.BlueText),
                      ),
                      Column(
                        children: [
                          Wrap(
                            children: [
                              for (int i = 0;
                                  i < bac_si.ct_lichkhams.length;
                                  i++)
                                if (bac_si.ct_lichkhams[i].ngaykham.day ==
                                    date.day)
                                  buildTime(0, i)
                            ],
                          )
                        ],
                      )
                    ]);
              })),
          actions: [
            Container(
              padding: const EdgeInsets.fromLTRB(0, 0, 15, 10),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'Đóng',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(0, 0, 15, 10),
              child: ElevatedButton(
                onPressed: () {
                  DatLich(bac_si);
                  //Navigator.of(context).pop();
                },
                child: const Text(
                  'Đặt lịch',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ]);
    } else {
      return Container();
    }
  }

  int selectIndex = 0;
  Widget buildTime(int buoi, int i) {
    Color color = Colors.white;
    if (i == selectIndex) {
      color = Colors.blue;
    }
    return GestureDetector(
      onTap: () {
        setState(() {
          selectIndex = i;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(),
        ),
        child: buoi == 0
            ? Text(
                "${DateFormat("hh:mm a").format(thoigiankham[i].GioBatDau)} - ${DateFormat("hh:mm a").format(thoigiankham[i].GioKetThuc)}")
            : const Text(""),
      ),
    );
  }

  void DatLich(BacSi bacsi) async {
    Phieu_DangKy phieu_dangKy = Phieu_DangKy(
        id: 0,
        noidung: noidungController.text,
        trangthai: 0,
        benhnhan: widget.benhnhan,
        ct_lichKham: bacsi.ct_lichkhams[selectIndex]);
    print(await Phieu_DangKyRepo()
        .PostPhieu_DangKy(phieu_dangKy.toMap(), widget.benhnhan.taiKhoan!.jwt));
  }
}

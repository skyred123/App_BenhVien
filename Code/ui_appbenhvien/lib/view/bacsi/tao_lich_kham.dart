// ignore_for_file: avoid_unnecessary_containers, non_constant_identifier_names

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:table_calendar/table_calendar.dart';
import 'package:ui_appbenhvien/core/app_export.dart';
import 'package:ui_appbenhvien/core/data/models/bac_si.dart';
import 'package:ui_appbenhvien/core/data/models/ct_lich_kham.dart';
import 'package:ui_appbenhvien/core/data/models/thoi_gian_kham.dart';
import 'package:ui_appbenhvien/core/data/repository/ct_lichkham_repository.dart';
import 'package:ui_appbenhvien/core/data/repository/thoigian_kham_repository.dart';

class TaoLichKhamPage extends StatefulWidget {
  final BacSi bacsi;
  const TaoLichKhamPage({super.key, required this.bacsi});

  @override
  TaoLichKhamPageState createState() => TaoLichKhamPageState();
}

class TaoLichKhamPageState extends State<TaoLichKhamPage> {
  bool loadData = false;
  DateTime toDay = DateTime.now();
  late List<ThoiGian_Kham> thoigiankham = [];
  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      toDay = day;
      GetThoiGianKham();
    });
  }

  Future<List<CT_LichKham>> GetCT_LichKham() async {
    List<CT_LichKham> list = [];
    for (var item in widget.bacsi.ct_lichkhams) {
      var ct_lich_kham = await CT_LichKhamRepo()
          .GetCT_LichKham(item.id.toString(), widget.bacsi.taiKhoan!.jwt);
      if (ct_lich_kham != null) {
        //print(ct_lich_kham);
        list.add(ct_lich_kham);
      }
    }
    return list;
  }

  void GetThoiGianKham() async {
    var lichkham =
        await ThoiGian_KhamRepo().GetsThoiGian_Kham(widget.bacsi.taiKhoan!.jwt);
    List<CT_LichKham> list_ctlichkham = await GetCT_LichKham();
    List<ThoiGian_Kham> temp = [];

    for (int i = 0; i < lichkham.length; i++) {
      bool update = false;
      for (CT_LichKham element in list_ctlichkham) {
        if (element.ngaykham.day == toDay.day) {
          if (element.thoiGian_Kham!.id == lichkham[i].id) {
            lichkham[i].trangthai = true;
          }
        }
      }
    }
    setState(() {
      thoigiankham = lichkham;
    });
  }

  @override
  void initState() {
    super.initState();
    ReloadPage(() {});
  }

  void ReloadPage(Function func) {
    func();
    GetThoiGianKham();
    if (!loadData) {
      loadData = true;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (loadData) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Tạo lịch khám",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: AppColors.darkBlue)),
        ),
        body: SingleChildScrollView(
          child: Column(mainAxisSize: MainAxisSize.max, children: [
            Container(
              child: TableCalendar(
                locale: "en_US",
                rowHeight: 43,
                availableGestures: AvailableGestures.all,
                selectedDayPredicate: (day) => isSameDay(day, toDay),
                focusedDay: toDay,
                headerStyle: const HeaderStyle(),
                firstDay: DateTime.utc(1969, 7, 20, 20, 18, 04),
                lastDay: DateTime.now().add(
                  const Duration(days: 7),
                ),
                availableCalendarFormats: const {
                  CalendarFormat.month: '',
                  CalendarFormat.twoWeeks: '',
                  CalendarFormat.week: ''
                },
                onDaySelected: _onDaySelected,
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.fromLTRB(15.0, 5, 15, 5),
              child: Text(
                "Vui lòng chọn thời gian",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.BlueText),
              ),
            ),
            // Container(
            //   padding: const EdgeInsets.all(15.0),
            //   child: Row(
            //     children: [
            //       Expanded(
            //           child: TextButton(
            //         onPressed: () {
            //           ReloadPage(() {
            //             selectedBuoi = 0;
            //           });
            //         },
            //         style: ButtonStyle(
            //             backgroundColor: MaterialStatePropertyAll(
            //                 selectedBuoi == 0
            //                     ? AppColors.BlueFooter
            //                     : AppColors.BlueBorder)),
            //         child: Text(
            //           "Buổi Sáng",
            //           style: TextStyle(
            //               color: AppColors.White,
            //               fontSize: 16,
            //               fontWeight: FontWeight.w600),
            //         ),
            //       )),
            //       const SizedBox(
            //         width: 5,
            //       ),
            //       Expanded(
            //           child: TextButton(
            //         onPressed: () {
            //           ReloadPage(() {
            //             selectedBuoi = 1;
            //           });
            //         },
            //         style: ButtonStyle(
            //             backgroundColor: MaterialStatePropertyAll(
            //                 selectedBuoi == 1
            //                     ? AppColors.BlueFooter
            //                     : AppColors.BlueBorder)),
            //         child: Text(
            //           "Buổi trưa",
            //           style: TextStyle(
            //               color: AppColors.White,
            //               fontSize: 16,
            //               fontWeight: FontWeight.w600),
            //         ),
            //       )),
            //       const SizedBox(
            //         width: 5,
            //       ),
            //       Expanded(
            //           child: TextButton(
            //         onPressed: () {
            //           ReloadPage(() {
            //             selectedBuoi = 2;
            //           });
            //         },
            //         style: ButtonStyle(
            //             backgroundColor: MaterialStatePropertyAll(
            //                 selectedBuoi == 2
            //                     ? AppColors.BlueFooter
            //                     : AppColors.BlueBorder)),
            //         child: Text(
            //           "Buổi tối",
            //           style: TextStyle(
            //               color: AppColors.White,
            //               fontSize: 16,
            //               fontWeight: FontWeight.w600),
            //         ),
            //       )),
            //     ],
            //   ),
            // ),
            Container(
              padding: const EdgeInsets.all(15.0),
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Wrap(
                  spacing: 8.0,
                  runSpacing: 10,
                  alignment: WrapAlignment.center,
                  children: [
                    for (int i = 0; i < thoigiankham.length; i++)
                      buildTime(0, i)
                  ],
                ),
              ),
            )
          ]),
        ),
        bottomNavigationBar: Container(
            padding: const EdgeInsets.all(20),
            child: TextButton(
              onPressed: taolichkham,
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll(AppColors.BlueFooter)),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Cập nhật lịch",
                  style: TextStyle(
                      color: AppColors.White,
                      fontSize: 18,
                      fontWeight: FontWeight.w800),
                ),
              ),
            )),
      );
    } else {
      return Container();
    }
  }

  Widget buildTime(int buoi, int i) {
    Color color = Colors.white;
    if (thoigiankham[i].trangthai) {
      color = Colors.blue;
    }
    return GestureDetector(
      onTap: () {
        setState(() {
          thoigiankham[i].trangthai = !thoigiankham[i].trangthai;
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

  void taolichkham() async {
    var ct_lich_khams = await GetCT_LichKham();
    List<ThoiGian_Kham> thoi_gian_kham1 = [];
    List<ThoiGian_Kham> thoi_gian_kham2 = [];
    for (var element in ct_lich_khams) {
      if (element.ngaykham.day == toDay.day) {
        thoi_gian_kham1.add(element.thoiGian_Kham!);
      }
    }
    for (var element in thoigiankham) {
      if (element.trangthai) {
        thoi_gian_kham2.add(element);
      }
    }
    List<int> list1 = thoi_gian_kham1.map((thoiGian) => thoiGian.id).toList();
    List<int> list2 = thoi_gian_kham2.map((thoiGian) => thoiGian.id).toList();

    Set<int> set1 = Set<int>.from(list1);
    Set<int> set2 = Set<int>.from(list2);
    Set<int> difference = set2.difference(set1);
    List<int> result = difference.toList();

    List<ThoiGian_Kham> thoi_gian_kham3 = [];
    for (var element in thoigiankham) {
      for (int item in result) {
        if (element.id == item) {
          thoi_gian_kham3.add(element);
        }
      }
    }
    for(var thoi_gian_kham in thoi_gian_kham3){
       CT_LichKham ct_lichKham = CT_LichKham(id: 0, ngaykham: toDay, bacsi: widget.bacsi, thoiGian_Kham: thoi_gian_kham);
      // print(ct_lichKham.toMap());
       await CT_LichKhamRepo().PostCT_LichKham(ct_lichKham.toMap(), widget.bacsi.taiKhoan!.jwt);
    }
    ReloadPage((){});
  }
}

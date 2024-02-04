// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ui_appbenhvien/core/app_export.dart';
import 'package:ui_appbenhvien/core/data/models/bac_si.dart';
import 'package:ui_appbenhvien/core/data/models/benhnhan.dart';
import 'package:ui_appbenhvien/core/fixwiget/line.dart';
import 'package:ui_appbenhvien/view/datkham/dat_lich_card.dart';

import 'thong_tin_bac_si.dart';

class TheBacSiCard extends StatefulWidget {
  final BacSi bacsi;
  final BenhNhan benhnhan;
  final String jwt;
  const TheBacSiCard(
      {super.key,
      required this.bacsi,
      required this.benhnhan,
      required this.jwt});

  @override
  State<StatefulWidget> createState() {
    return TheBacSiCardState();
  }
}

class TheBacSiCardState extends State<TheBacSiCard> {
  bool loadData = false;
  DateTime date = DateTime.now();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ReloadPage(() {});
  }

  void ReloadPage(Function func) {
    setState(() {
      func;
      loadData = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (loadData) {
      return GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ThongTinBacSiPage(
                    bacsi: widget.bacsi,
                    benhnhan: widget.benhnhan,
                  )));
        },
        child: Container(
          width: 355,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.BlueBorder),
            color: AppColors.White,
            boxShadow: [
              BoxShadow(
                color: AppColors.BlueDam.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(2, 6),
              )
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      height: 55,
                      width: 55,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(ImageConstant.image_iconmeo),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(100)),
                    ),
                    SizedBox(
                      width: 275,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 200,
                                child: Text(
                                  widget.bacsi.hoTen,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.BlueDam),
                                  overflow: TextOverflow.clip,
                                ),
                              ),
                              // Row(
                              //   children: [
                              //     Container(
                              //         height: 20,
                              //         width: 20,
                              //         decoration: BoxDecoration(
                              //           image: DecorationImage(
                              //             image: AssetImage(
                              //                 ImageConstant.image_khamtructiep),
                              //             fit: BoxFit.cover,
                              //           ),
                              //         )),
                              //     const SizedBox(
                              //       width: 5,
                              //     ),
                              //     const Text(
                              //       "Thú Y",
                              //       textAlign: TextAlign.center,
                              //       style: TextStyle(
                              //           fontSize: 12, fontWeight: FontWeight.w500),
                              //     ),

                              //   ],
                              // ),
                              // Container(
                              //   margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                              //   padding: EdgeInsets.fromLTRB(10, 3, 10, 3),
                              //   decoration: BoxDecoration(
                              //     color: AppColors.Blue.withOpacity(0.2),
                              //     border: Border.all(color: AppColors.BlueDam),
                              //     borderRadius: BorderRadius.circular(30)
                              //   ),
                              //   child: Text("Hỗ trợ",style: TextStyle(color: AppColors.BlueDam,fontWeight: FontWeight.w800),),
                              // )
                            ],
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.only(right: 10.0),
                          //   child: Row(
                          //     children: [
                          //       Icon(
                          //         Icons.star_rate,
                          //         color: AppColors.Orange,
                          //       ),
                          //       Text("5.5",
                          //           style: TextStyle(
                          //               color: AppColors.BlueDam,
                          //               fontWeight: FontWeight.w600)),
                          //       Text("\\",
                          //           style: TextStyle(
                          //               color: AppColors.BlueDam,
                          //               fontWeight: FontWeight.w600)),
                          //       Text("5",
                          //           style: TextStyle(
                          //               color: AppColors.BlueDam,
                          //               fontWeight: FontWeight.w600))
                          //     ],
                          //   ),
                          // )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Line(
                  dashSpace: 20,
                  dashWidth: 20,
                  color: AppColors.BlueDam,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Icon(
                      Icons.attach_money_sharp,
                      color: AppColors.BlueDam,
                    ),
                    Text(
                      "Phí thăm khám cố định ",
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          color: AppColors.BlueDam),
                    ),
                    Text("500.000đ",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: AppColors.Green))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Giờ đặt tiếp theo ",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: AppColors.BlueDam),
                        ),
                        Text(
                          DateFormat('dd/MM/yyyy - HH:mm')
                              .format(DateTime.now()),
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w800),
                        )
                      ],
                    ),
                    TextButton(
                        onPressed: () {
                          //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DatLichKhamPage()));
                          if (widget.bacsi.ct_lichkhams != null ||
                              widget.bacsi.ct_lichkhams.isNotEmpty) {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return DatLichDialog(
                                    id: widget.bacsi.id.toString(),
                                    benhnhan: widget.benhnhan,
                                  );
                                });
                          }
                        },
                        child: Text(
                          "Đặt hẹn",
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              color: AppColors.BlueDam),
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      );
    } else
      return Container();
  }
}

// ignore_for_file: use_key_in_widget_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ui_appbenhvien/core/app_export.dart';

class DatLichKhamPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DatLichKhamPageState();
  }
}

class _DatLichKhamPageState extends State<DatLichKhamPage> {
  int selectShow = 0;
  PageReload(Function func) {
    setState(() {
      func;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.BlueBorder,
        automaticallyImplyLeading: false,
        toolbarHeight: 130,
        title: Container(
          padding: const EdgeInsets.all(20),
          child: Column(children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: [
                TextButton(onPressed: () {}, child: const Text("Hủy"))
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 10),
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: AppColors.White,
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: Row(
                    children: [
                      Container(
                          margin: const EdgeInsets.only(right: 10),
                          child: const Icon(
                            Icons.abc,
                            size: 40,
                          )),
                      const Text(
                        "Đa khoa",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      )
                    ],
                  )),
                  IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {},
                  )
                ],
              ),
            )
          ]),
        ),
      ),
      body: Column(children: [
        Container(
          margin: const EdgeInsets.only(top: 10, left: 15, right: 15),
          child: LayoutBuilder(builder: ((context, constraints) {
            double width = constraints.maxWidth / 2 - 10;
            return Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    selectShow = 0;
                    PageReload(() {});
                  },
                  child: Container(
                    width: width,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: selectShow == 0
                            ? AppColors.Blue
                            : AppColors.Blue.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      "Đặt lịch khám trực tiếp",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: selectShow == 0
                            ? AppColors.White
                            : AppColors.darkBlue,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    selectShow = 1;
                    PageReload(() {});
                  },
                  child: Container(
                    width: width,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: selectShow == 1
                            ? AppColors.Blue
                            : AppColors.Blue.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      "Đặt lịch khám từ xa",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: selectShow == 1
                            ? AppColors.White
                            : AppColors.darkBlue,
                      ),
                    ),
                  ),
                ),
              ],
            );
          })),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                  child: Text(
                "sl kết quả",
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16),
              )),
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: AppColors.Blue.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    SvgPicture.asset(SVGConstant.loc, width: 30, height: 25),
                    SizedBox(
                      width: 2,
                    ),
                    const Text("Lọc",
                        style: TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 16))
                  ],
                ),
              )
            ],
          ),
        ),
        //BuildBody(),
      ]),
    );
  }

  Widget BuildBody() {
    return Container();
  }
}

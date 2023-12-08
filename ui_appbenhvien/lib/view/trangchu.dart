// ignore_for_file: non_constant_identifier_names, avoid_unnecessary_containers, use_key_in_widget_constructors, camel_case_types

import 'dart:math';

import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:ui_appbenhvien/core/app_export.dart';
import 'package:ui_appbenhvien/core/fixwiget/horizontalscroll.dart';
import 'package:ui_appbenhvien/core/fixwiget/line.dart';
import 'package:lottie/lottie.dart';
import 'package:ui_appbenhvien/view/videocall/callpage.dart';

class trangchuPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _trangchuState();
  }
}

class _trangchuState extends State<trangchuPage> {
  String getGreeting() {
    var now = DateTime.now();
    var hour = now.hour;

    if (hour < 12) {
      return 'Chào buổi sáng';
    } else if (hour < 17) {
      return 'Chào buổi chiều';
    } else {
      return 'Chào buổi tối';
    }
  }

  // ignore: prefer_final_fields
  List<Widget> listDanhMuc() {
    Size size = const Size(40, 40);
    return [
      GestureDetector(
        child: Column(
          children: [
            Container(
              height: size.height,
              width: size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ImageConstant.image_thuoc),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              width: 200,
              child: Text(
                "Thuốc và thực phẩm \n chức năng",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
      GestureDetector(
        child: Column(
          children: [
            Container(
              height: size.height,
              width: size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ImageConstant.image_lichsu),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              width: 200,
              child: Text(
                "Lịch sử đặt lịch",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
      GestureDetector(
        child: Column(
          children: [
            Container(
              height: size.height,
              width: size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ImageConstant.image_baivietdaluu),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              width: 200,
              child: Text(
                "Bài viết đã lưu",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
      GestureDetector(
        onTap: () {
          //int call_id = Random().nextInt(9999999) + 1000000;
          //String user_ID = (Random().nextInt(9999999) + 1000000).toString();
          //String user_Name = (Random().nextInt(9999999) + 1000000).toString();
          //Navigator.of(context).push(MaterialPageRoute(builder: (context){return CallPage(call_id: call_id, user_ID: user_ID, user_Name: user_Name);}));
        },
        child: Column(
          children: [
            Container(
              height: size.height,
              width: size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ImageConstant.image_khamtuxa),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              width: 200,
              child: Text(
                "Đặt lịch khám \ntừ xa",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
      GestureDetector(
        child: Column(
          children: [
            Container(
              height: size.height,
              width: size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ImageConstant.image_khamtructiep),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              width: 200,
              child: Text(
                "Đặt lịch khám \ntrực tiếp",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
      GestureDetector(
        child: Column(
          children: [
            Container(
              height: size.height,
              width: size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ImageConstant.image_chuyenmuc),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              width: 200,
              child: Text(
                "Chuyên mục",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 90,
          //backgroundColor: AppTheme.Transparent,
          elevation: 0,
          flexibleSpace: Container(
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                color: AppTheme.BlueBackground),
          ),
          title: BuildTieuDe(context),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SingleChildScrollView(
                child: BuildDanhMuc(context),
              ),
              Divider(
                color: AppTheme.BlueDam,
                thickness: 2,
              ),
              BuildBacSi(context),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: BuildKhaoSat(context),
              )
            ],
          ),
        ));
  }

  Widget BuildKhaoSat(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppTheme.BlueFooter, borderRadius: BorderRadius.circular(30)),
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Lottie.asset(AnimationConstant.animation_like,
              height: 200, width: double.infinity),
          Text(
            "Chia sẻ trải nghiệm ứng dụng",
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontSize: 18,
                color: AppTheme.White,
                fontWeight: FontWeight.w900),
          ),
          Text(
            "Ý kiến của bạn sẽ giúp đội ngũ lập trình\n phát triển ứng dụng tốt hơn!",
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontSize: 14,
                color: AppTheme.White,
                fontWeight: FontWeight.w400),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: ElevatedButton(
                onPressed: () {},
                child: SizedBox(
                  height: 55,
                  width: 300,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: Text(
                          "Mở khảo sát trải nghiệm",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: AppTheme.BlueFooter,
                              fontWeight: FontWeight.w700),
                              overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                )),
          )
        ],
      ),
    );
  }

  Widget BuildBacSi(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          children: [
            const Padding(
              padding: EdgeInsets.only(top:6,left: 20, right: 10),
              child: Text(
                "Bác sĩ",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.navigate_next),
            )
          ],
        ),
        BuilListCard(context),
      ],
    );
  }

  Widget BuilListCard(BuildContext context) {
    int count = 8;
    if (DeviceSize.SizeDeviceMobileWeb()) {
      count = 4;
    }
    return Container(
      padding: const EdgeInsets.all(10),
      child: Center(
        child: Wrap(
          alignment: WrapAlignment.start,
          spacing: 30.0,
          runSpacing: 20.0,
          children: [
            for (int i = 0; i < count; i++)
              HorizontalScroll(
                  startup: 370,
                  child: Container(
                    width: 355,
                    height: 190,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: AppTheme.BlueBorder),
                      color: AppTheme.White,
                      boxShadow: [
                        BoxShadow(
                          color: AppTheme.BlueDam.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(2, 6),
                        )
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
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
                                      image: AssetImage(
                                          ImageConstant.image_iconmeo),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(100)),
                              ),
                              SizedBox(
                                width: 275,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 200,
                                          child: Text(
                                            "Đội ngũ bác sĩ nhi đồng 315",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700,
                                                color: AppTheme.BlueDam),
                                            overflow: TextOverflow.clip,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                                height: 20,
                                                width: 20,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                        ImageConstant
                                                            .image_khamtructiep),
                                                    fit: BoxFit.cover,
                                                  ),
                                                )),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            const Text(
                                              "Thú Y",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 10.0),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.star_rate,
                                            color: AppTheme.Orange,
                                          ),
                                          Text("5.5",
                                              style: TextStyle(
                                                  color: AppTheme.BlueDam,
                                                  fontWeight: FontWeight.w600)),
                                          Text("\\",
                                              style: TextStyle(
                                                  color: AppTheme.BlueDam,
                                                  fontWeight: FontWeight.w600)),
                                          Text("5",
                                              style: TextStyle(
                                                  color: AppTheme.BlueDam,
                                                  fontWeight: FontWeight.w600))
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Line(
                            dashSpace: 10,
                            dashWidth: 10,
                            color: AppTheme.BlueDam,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              const Icon(Icons.attach_money_sharp),
                              Text(
                                "Phí thăm khám cố định ",
                                style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    color: AppTheme.BlueDam),
                              ),
                              Text("500.000đ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: AppTheme.Green))
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 10, right: 10),
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
                                        color: AppTheme.BlueDam),
                                  ),
                                  Text(
                                    DateFormat('dd/MM/yyyy - HH:mm')
                                        .format(DateTime.now()),
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w800),
                                  )
                                ],
                              ),
                              TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Đặt hẹn",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        color: AppTheme.BlueDam),
                                  ))
                            ],
                          ),
                        )
                      ],
                    ),
                  ))
          ],
        ),
      ),
    );
  }

  Widget BuildTieuDe(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Wrap(
          alignment: WrapAlignment.spaceBetween,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    width: 270,
                    child: Text(
                      getGreeting(),
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 13, color: AppTheme.BlueText),
                    ),
                  ),
                  SizedBox(
                    width: 300,
                    child: Text(
                      'Nguyen Van Thang',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: AppTheme.BlueText,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ]),
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: AppTheme.BlueDam,
                  borderRadius: BorderRadius.circular(100)),
              child: Icon(
                Icons.notifications_none,
                color: AppTheme.White,
                size: 30,
              ),
            )
          ]),
    );
  }

  Widget BuildDanhMuc(BuildContext context) {
    if (DeviceSize.SizeDeviceMobileWeb()) {
      return Container(
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: listDanhMuc(),
              ),
            ),
          ),
        ]),
      );
    } else {
      return Container(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Wrap(
            spacing: 8.0,
            runSpacing: 25.0,
            children: listDanhMuc(),
          ),
        ),
      );
    }
  }
}

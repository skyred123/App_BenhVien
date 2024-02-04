// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ui_appbenhvien/core/app_export.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ui_appbenhvien/core/data/models/tai_khoan.dart';

class CapNhatThongTinPage extends StatefulWidget {
  @override
  State<CapNhatThongTinPage> createState() => _CapNhatThongTinPageState();
}

class _CapNhatThongTinPageState extends State<CapNhatThongTinPage> {
  DateTime selectedDate = DateTime.now();
  int _selectedValue = 0;

  void _ChonCuongDo(int value) {
    setState(() {
      _selectedValue = value;
    });
  }

  List<Map<String, dynamic>> listCuongDoHoatDong = [
    {
      "icon": SvgPicture.asset(
        SVGConstant.cuong_do_1,
        width: 200,
        height: 80,
      ),
      "text": "Ít"
    },
    {
      "icon": SvgPicture.asset(
        SVGConstant.cuong_do_2,
        width: 200,
        height: 80,
      ),
      "text": "Trung bình"
    },
    {
      "icon": SvgPicture.asset(
        SVGConstant.cuong_do_3,
        width: 200,
        height: 80,
      ),
      "text": "Khá"
    },
    {
      "icon": SvgPicture.asset(
        SVGConstant.cuong_do_4,
        width: 200,
        height: 80,
      ),
      "text": "Nhiều"
    },
    {
      "icon": SvgPicture.asset(
        SVGConstant.cuong_do_5,
        width: 200,
        height: 80,
      ),
      "text": "Tối đa"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.lightBlue,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Expanded(
                      child: Text(
                        "Cập nhật thông tin",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 30,
                          fontFamily: 'Comfortaa',
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const Icon(Icons.exit_to_app,size: 35)
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Ngày sinh của bạn",
                    style: TextStyle(
                      fontSize: 22,
                      fontFamily: 'Comfortaa',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                GestureDetector(
                  onTap: () async {
                    final DateTime? dateTime = await showDatePicker(
                      context: context,
                      initialDate: selectedDate,
                      firstDate: DateTime(2000),
                      lastDate: DateTime(3000),
                    );

                    if (dateTime != null) {
                      setState(() {
                        selectedDate = dateTime;
                      });
                    }
                  },
                  child: Container(
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            width: 1, color: Color(0xFFE1E1E1)),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      shadows: const [
                        BoxShadow(
                          color: Color(0x3F000000),
                          blurRadius: 4,
                          offset: Offset(0, 4),
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 30, right: 30, top: 15, bottom: 15),
                      child: Row(
                        children: [
                          // Day
                          Expanded(
                            child: Text(
                              DateFormat("dd/MM/yyyy").format(selectedDate),
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontFamily: 'Comfortaa',
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),

                          SvgPicture.asset(
                            SVGConstant.lich,
                            width: 30,
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                LayoutBuilder(
                  builder: (context, constraints) {
                    double width = constraints.maxWidth / 2 - 30;
                    return Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Chiều cao",
                                style: TextStyle(
                                  fontFamily: 'Comfortaa',
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      decoration: ShapeDecoration(
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          side: const BorderSide(
                                              width: 1,
                                              color: Color(0xFFE1E1E1)),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        shadows: const [
                                          BoxShadow(
                                            color: Color(0x3F000000),
                                            blurRadius: 4,
                                            offset: Offset(0, 4),
                                            spreadRadius: 0,
                                          ),
                                        ],
                                      ),
                                      child: TextField(
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            borderSide: const BorderSide(
                                              width: 0,
                                              style: BorderStyle.none,
                                            ),
                                          ),
                                          fillColor: Colors.white,
                                          filled: true,
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 20, vertical: 15),
                                        ),
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            fontSize: 23,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Comfortaa'),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  const Text(
                                    "cm",
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontFamily: 'Comfortaa',
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const Text(
                                "Cân nặng",
                                style: TextStyle(
                                  fontFamily: 'Comfortaa',
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Container(
                                      decoration: ShapeDecoration(
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          side: const BorderSide(
                                              width: 1,
                                              color: Color(0xFFE1E1E1)),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        shadows: const [
                                          BoxShadow(
                                            color: Color(0x3F000000),
                                            blurRadius: 4,
                                            offset: Offset(0, 4),
                                            spreadRadius: 0,
                                          ),
                                        ],
                                      ),
                                      child: TextField(
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            borderSide: const BorderSide(
                                              width: 0,
                                              style: BorderStyle.none,
                                            ),
                                          ),
                                          fillColor: Colors.white,
                                          filled: true,
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 20, vertical: 15),
                                        ),
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            fontSize: 23,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Comfortaa'),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  const Text(
                                    "kg",
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontFamily: 'Comfortaa',
                                        fontWeight: FontWeight.w600),
                                  ),
                                  //const SizedBox(width: 45),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Chọn cường độ hoạt động: ",
                    style: TextStyle(
                      fontSize: 22,
                      fontFamily: 'Comfortaa',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                for (int i = 0; i < listCuongDoHoatDong.length; i++)
                  BuildCuongDoHoatDong(i, listCuongDoHoatDong[i]['icon'],
                      listCuongDoHoatDong[i]['text']),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    backgroundColor: AppColors.green,
                  ),
                  child: const Text(
                    'Cập nhật',
                    style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'Comfortaa',
                        color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
              ]),
            ),
          ),
        ));
  }

  Widget BuildCuongDoHoatDong(int index, Widget icon, String text) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            // Điều khiển thay đổi giá trị của Radio
            setState(() {
              _selectedValue = index;
            });
          },
          child: Container(
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 1, color: Color(0xFFE1E1E1)),
                borderRadius: BorderRadius.circular(25),
              ),
              shadows: const [
                BoxShadow(
                  color: Color(0x3F000000),
                  blurRadius: 4,
                  offset: Offset(0, 4),
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 5, right: 5, top: 0, bottom: 0),
              child: Row(
                children: [
                  MediaQuery.of(context).size.width< 255 ? Container(): icon,
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Text(
                      text,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 20,
                        fontFamily: 'Comfortaa',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Transform.scale(
                      scale:
                          1.5, // Điều chỉnh kích thước dấu tích theo ý muốn của bạn
                      child: Radio(
                        value: index,
                        groupValue: _selectedValue,
                        activeColor: AppColors.darkBlue,
                        onChanged: (value) => _ChonCuongDo(value!),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}

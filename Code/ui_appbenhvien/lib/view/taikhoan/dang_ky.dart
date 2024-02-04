// ignore_for_file: non_constant_identifier_names, avoid_dynamic_calls, use_named_constants, unrelated_type_equality_checks

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../core/app_export.dart';
import '../../core/data/models/benhnhan.dart';
import '../../core/data/models/tai_khoan.dart';
import '../../core/data/repository/benhnhan_repository.dart';
import '../../core/data/repository/taikhoan_repository.dart';

class DangKyPage extends StatefulWidget {
  const DangKyPage({Key? key}) : super(key: key);

  @override
  State<DangKyPage> createState() => _DangKyPageState();
}

class _DangKyPageState extends State<DangKyPage> {
  bool _isMale = true;
  bool _isFemale = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  DateTime date = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
            child: Stack(children: [
          if (DeviceSize.SizeDeviceMobileWeb())
            Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment(0.31, -0.95),
                end: Alignment(-0.31, 0.95),
                colors: [
                  AppColors.lightBlue,
                  AppColors.mediumDarkBlue,
                ],
              )),
              alignment: Alignment.bottomCenter,
              child: SvgPicture.asset(
                SVGConstant.luon,
                width: double.infinity,
                height: 200,
                fit: BoxFit.fill,
              ),
            )
          else
            Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment(0.31, -0.95),
                end: Alignment(-0.31, 0.95),
                colors: [
                  AppColors.lightBlue,
                  AppColors.mediumDarkBlue,
                ],
              )),
            ),
          SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 60,
                    ),
                    SvgPicture.asset(
                      SVGConstant.logo,
                      width: 100,
                      height: 100,
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: AppColors.lightBlue.withOpacity(0.7),
                      ),
                      child: Container(
                        padding:
                            const EdgeInsets.only(left: 25, right: 25, top: 10),
                        child: Column(children: [
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    width: 1, color: Color(0xFFE1E1E1)),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              shadows: const [
                                BoxShadow(
                                  color: Color(0x3F000000),
                                  blurRadius: 4,
                                  offset: Offset(0, 4),
                                  spreadRadius: 0,
                                )
                              ],
                            ),
                            child: TextField(
                              controller: nameController,
                              decoration: InputDecoration(
                                hintText: 'Tên Đăng Nhập',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    borderSide: const BorderSide(
                                        width: 0, style: BorderStyle.none)),
                                fillColor: Colors.white,
                                filled: true,
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 20),
                              ),
                              style: const TextStyle(
                                  fontSize: 17, fontFamily: 'Comfortaa'),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    width: 1, color: Color(0xFFE1E1E1)),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              shadows: const [
                                BoxShadow(
                                  color: Color(0x3F000000),
                                  blurRadius: 4,
                                  offset: Offset(0, 4),
                                  spreadRadius: 0,
                                )
                              ],
                            ),
                            child: TextField(
                              controller: emailController,
                              decoration: InputDecoration(
                                hintText: 'Nhập Email',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    borderSide: const BorderSide(
                                        width: 0, style: BorderStyle.none)),
                                fillColor: Colors.white,
                                filled: true,
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 20),
                              ),
                              style: const TextStyle(
                                  fontSize: 17, fontFamily: 'Comfortaa'),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    width: 1, color: Color(0xFFE1E1E1)),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              shadows: const [
                                BoxShadow(
                                  color: Color(0x3F000000),
                                  blurRadius: 4,
                                  offset: Offset(0, 4),
                                  spreadRadius: 0,
                                )
                              ],
                            ),
                            child: TextField(
                              controller: passwordController,
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: 'Mật khẩu',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    borderSide: const BorderSide(
                                        width: 0, style: BorderStyle.none)),
                                fillColor: Colors.white,
                                filled: true,
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 20),
                              ),
                              style: const TextStyle(
                                  fontSize: 17, fontFamily: 'Comfortaa'),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    width: 1, color: Color(0xFFE1E1E1)),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              shadows: const [
                                BoxShadow(
                                  color: Color(0x3F000000),
                                  blurRadius: 4,
                                  offset: Offset(0, 4),
                                  spreadRadius: 0,
                                )
                              ],
                            ),
                            child: TextField(
                              controller: confirmPasswordController,
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: 'Nhập Lại Mật khẩu',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    borderSide: const BorderSide(
                                        width: 0, style: BorderStyle.none)),
                                fillColor: Colors.white,
                                filled: true,
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 20),
                              ),
                              style: const TextStyle(
                                  fontSize: 17, fontFamily: 'Comfortaa'),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          ElevatedButton(
                              style: ButtonStyle(
                                  padding: MaterialStateProperty.all<
                                      EdgeInsetsGeometry>(
                                    const EdgeInsets.all(
                                        10.0), // Padding cho nút
                                  ),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          30.0), // Độ cong của góc nút
                                    ),
                                  ),
                                  shadowColor: MaterialStateProperty.all(
                                      Colors.black.withOpacity(0.9)),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white)),
                              onPressed: () async {
                                final result = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(3000));
                                setState(() {
                                  if (result != null &&
                                      result.isBefore(DateTime.now())) {
                                    date = result;
                                  }
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    SizedBox(
                                      child: Text(
                                        DateFormat('dd/MM/yyy').format(date),
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
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              Checkbox(
                                value: _isMale,
                                onChanged: (value) {
                                  setState(() {
                                    if (value != null) {
                                      if (value == false) {
                                        _isFemale = true;
                                        _isMale = value;
                                      } else {
                                        _isFemale = false;
                                        _isMale = value;
                                      }
                                    }
                                  });
                                },
                              ),
                              const Text(
                                'Nam',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Checkbox(
                                value: _isFemale,
                                onChanged: (bool? value) {
                                  setState(() {
                                    if (value != null) {
                                      if (value == false) {
                                        _isFemale = value;
                                        _isMale = true;
                                      } else {
                                        _isFemale = value;
                                        _isMale = false;
                                      }
                                    }
                                  });
                                },
                              ),
                              const Text('Nữ',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    width: 1, color: Color(0xFFE1E1E1)),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              shadows: const [
                                BoxShadow(
                                  color: Color(0x3F000000),
                                  blurRadius: 4,
                                  offset: Offset(0, 4),
                                  spreadRadius: 0,
                                )
                              ],
                            ),
                            child: TextField(
                              controller: addressController,
                              decoration: InputDecoration(
                                hintText: 'Nhập địa chỉ',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    borderSide: const BorderSide(
                                        width: 0, style: BorderStyle.none)),
                                fillColor: Colors.white,
                                filled: true,
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 20),
                              ),
                              style: const TextStyle(
                                  fontSize: 17, fontFamily: 'Comfortaa'),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              CreateAccount();
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              backgroundColor: const Color(0xFF018ABE),
                            ),
                            child: const Text(
                              'Đăng Ký',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'Comfortaa',
                                  color: Colors.white),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                        ]),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ])));
  }

  Future<void> CreateAccount() async {
    if (passwordController.text == confirmPasswordController.text) {
       final name = nameController.text;
      final email = emailController.text;
      final pass = passwordController.text;
      final confirmpass = confirmPasswordController.text;
      final address = addressController.text;
      var sex = true;
      if (_isMale == false) {
        sex = false;
      }
      if (name != '' || pass != '' || confirmpass != '' || sex != '') {
        final d = jsonDecode(await TaiKhoanRepo().Register(TaiKhoan(
                id: 0,
                jwt: '',
                username: '',
                email: '',
                provider: '',
                role: '',
                confirmed: false,
                blocked: false)
            .toMapDangKy(name, email, pass)));
        if (d['jwt'] != null) {
          final tk = TaiKhoan.fromMap(d);
          final bn = BenhNhan(
              id: 0,
              hoTen: name,
              gioiTinh: sex,
              ngaysinh: date,
              diachi: address,
              taiKhoan: tk);
           await BenhNhanRepo().PostBenhNhan(bn.toMap(), '4819751bf816349627f7f604e5634ada16fe02dbcdf2e0eb07a3cccb2540b8ea53f51931248e74d2be3e94c7d057f670c99ce797304664b15ef5b840dc2ac068f9aa7a91092e1995fa7fcd52343f375649529ae371827b824b806160f290890138d970d6f68d5fbf3ab231cae76585224f6403f60f9d4ba1371e3e9d27609e96');
        }
      }
    }
  }
}

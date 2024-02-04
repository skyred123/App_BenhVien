// ignore_for_file: non_constant_identifier_names, use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ui_appbenhvien/core/app_export.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ui_appbenhvien/core/data/map.dart';
import 'package:ui_appbenhvien/core/data/models/tai_khoan.dart';
import 'package:ui_appbenhvien/core/data/repository/quyen_repository.dart';
import 'package:ui_appbenhvien/core/data/repository/taikhoan_repository.dart';
import 'package:ui_appbenhvien/view/taikhoan/dang_ky.dart';
import 'package:ui_appbenhvien/view/trang_chu.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class DangNhapPage extends StatefulWidget {
  const DangNhapPage({Key? key}) : super(key: key);

  @override
  State<DangNhapPage> createState() => _DangNhapPageState();
}

class _DangNhapPageState extends State<DangNhapPage> {
  TextEditingController _emailController =
      TextEditingController(text: 'user1@gmail.com');
  TextEditingController _passwordController =
      TextEditingController(text: '123456');

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
                width: MediaQuery.of(context).size.width,
                height: 200,
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
          Center(
            child: Padding(
              padding: const EdgeInsets.all(30),
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
                          const EdgeInsets.only(left: 25, right: 20, top: 10),
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
                            controller: _emailController,
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
                            obscureText: true,
                            controller: _passwordController,
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
                          height: 5,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              foregroundColor: AppColors.darkBlue,
                            ),
                            child: const Text(
                              "Quên mật khẩu?",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontFamily: 'Comfortaa', fontSize: 15),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            _DangNhap(_emailController.text,
                                _passwordController.text);
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            backgroundColor: const Color(0xFF018ABE),
                          ),
                          child: const Text(
                            'Đăng Nhập',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Comfortaa',
                                color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15, bottom: 20),
                          child: Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              const Text(
                                "Bạn chưa có tài khoản?",
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: AppColors.darkBlue,
                                    fontFamily: 'Comfortaa',
                                    fontSize: 14),
                              ),
                              TextButton(
                                  onPressed: _NhanDangKy,
                                  child: const Text(
                                    "Đăng Ký",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color(0xFF3866C0),
                                        fontFamily: 'Comfortaa',
                                        fontSize: 14,
                                        decoration: TextDecoration.underline,
                                        decorationColor: Color(0xFF3866C0)),
                                  )),
                            ],
                          ),
                        )
                      ]),
                    ),
                  )
                ],
              ),
            ),
          )
        ])));
  }

  Future<void> _DangNhap(String email, String password) async {
    var result = jsonDecode(await TaiKhoanRepo()
        .PostTaiKhoan(MapJson.toMapDangNhap(email, password)));
    if (result['jwt'] != null) {
      TaiKhoan temp = TaiKhoan.fromMap(result);
      temp.role = await GetRole(temp.jwt);
      TaiKhoan taikhoan = temp; 
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return TrangChuPage(taikhoan: taikhoan);
      }));
    } else {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.info,
        animType: AnimType.rightSlide,
        title: 'Thông báo',
        desc: 'Đăng nhập không thành công',
        btnCancelOnPress: () {},
        btnOkOnPress: () {},
      ).show();
    }
  }

  Future<String> GetRole(String jwt) async{
    return await RoleRepo().GetRole(jwt);
  }

  Future<void> _NhanDangKy() async {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const DangKyPage()));
  }
}

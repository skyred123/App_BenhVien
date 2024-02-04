import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ui_appbenhvien/core/app_export.dart';
import 'package:ui_appbenhvien/core/data/models/tai_khoan.dart';
import 'package:ui_appbenhvien/view/taikhoan/cap_nhat_thong_tin_tai_khoan.dart';

class ThongTinTaiKhoan extends StatefulWidget {
  final TaiKhoan taikhoan;
  const ThongTinTaiKhoan({Key? key, required this.taikhoan}) : super(key: key);

  @override
  State<ThongTinTaiKhoan> createState() => _ThongTinTaiKhoanState();
}

class _ThongTinTaiKhoanState extends State<ThongTinTaiKhoan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        //backgroundColor: AppColors.lightBlue,
        appBar: AppBar(
          primary: true,
          leading: Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios_rounded),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  color: Colors.white,
                ),
              ],
            ),
          ),
          backgroundColor: AppColors.lightBlue,
          title: const Padding(
            padding: EdgeInsets.only(top: 5),
            child: Text(
              "Thông tin tài khoản",
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Comfortaa",
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ),
        body: SafeArea(
            child: Padding(
          padding:
              const EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 30),
          child: Column(
            children: [
              Row(
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
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.taikhoan.username,
                          style: const TextStyle(
                              fontSize: 18,
                              fontFamily: 'Comfortaa',
                              fontWeight: FontWeight.w900,
                              color: Colors.black),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          widget.taikhoan.email,
                          style: const TextStyle(
                              fontSize: 14,
                              fontFamily: 'Comfortaa',
                              color: Colors.black),
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          CapNhatThongTinTaiKhoanPage(taikhoan: widget.taikhoan)));
                        },
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(width: 1, color: AppColors.grey),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 15, bottom: 15, right: 20, left: 20),
                    child: Row(children: [
                      SvgPicture.asset(SVGConstant.lich,
                          width: 35,
                          height: 35,
                          // ignore: deprecated_member_use
                          color: AppColors.mediumDarkBlue),
                      const SizedBox(
                        width: 25,
                      ),
                      const Text(
                        "Lịch sử đặt lịch",
                        style: TextStyle(
                          fontFamily: "Comfortaa",
                          fontSize: 16,
                        ),
                      )
                    ]),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(width: 1, color: AppColors.grey),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 15, bottom: 15, right: 20, left: 20),
                    child: Row(children: [
                      Image.asset(
                        ImageConstant.image_can,
                        width: 30,
                        height: 30,
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      const Text(
                        "Sức khỏe của tôi",
                        style: TextStyle(
                          fontFamily: "Comfortaa",
                          fontSize: 16,
                        ),
                      )
                    ]),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Cài đặt",
                  style: TextStyle(
                      fontFamily: "Comfortaa",
                      fontSize: 18,
                      fontWeight: FontWeight.w900),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(width: 1, color: AppColors.grey),
                        ),
                        child:const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 20),
                          child: Text(
                            "Cài đặt ứng dụng",
                            style: TextStyle(
                              fontFamily: "Comfortaa",
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 20,
              ),

              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(width: 1, color: AppColors.grey),
                        ),
                        child:const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 20),
                          child: Text(
                            "Đổi mật khẩu",
                            style: TextStyle(
                              fontFamily: "Comfortaa",
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )));
  }
}

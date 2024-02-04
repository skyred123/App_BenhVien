// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:ui_appbenhvien/core/app_export.dart';
import 'package:ui_appbenhvien/view/suckhoe/cap_nhat_suc_khoe.dart';


class SucKhoePage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.lightBlue,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Sức khỏe của tôi",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 30,
                          fontFamily: 'Comfortaa',
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Wrap(
                    children: [
                      const Text(
                        "Thông tin",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 25,
                            fontFamily: 'Comfortaa',
                            fontWeight: FontWeight.w900),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          _CapNhatThonTin(context);
                        },
                        child: const Icon(Icons.edit_square),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            width: 1, color: Color(0xFFE1E1E1)),
                        borderRadius: BorderRadius.circular(20),
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
                    child: const Padding(
                      padding: EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 40),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Tuổi",
                                      style: TextStyle(
                                          fontSize: 18, fontFamily: 'Comfortaa',fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Chưa có thông tin",
                                    style: TextStyle(
                                        fontSize: 18, fontFamily: 'Comfortaa'),
                                  ),
                                ),
                              ),
                            ],
                          ),
        
                          SizedBox(height: 5,),
        
                          Divider(
                            height: 1,
                            color: AppColors.lightBlue,
                            thickness: 1,
                          ),
        
                          SizedBox(height: 30,),
        
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Cân nặng",
                                      style: TextStyle(
                                          fontSize: 18, fontFamily: 'Comfortaa',fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Chưa có thông tin",
                                    style: TextStyle(
                                        fontSize: 18, fontFamily: 'Comfortaa'),
                                  ),
                                ),
                              ),
                            ],
                          ),
        
                          SizedBox(height: 5,),
        
                          Divider(
                            height: 1,
                            color: AppColors.lightBlue,
                            thickness: 1,
                          ),
        
                          SizedBox(height: 30,),
        
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Chiều cao",
                                      style: TextStyle(
                                          fontSize: 18, fontFamily: 'Comfortaa',fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Chưa có thông tin",
                                    style: TextStyle(
                                        fontSize: 18, fontFamily: 'Comfortaa'),
                                  ),
                                ),
                              ),
                            ],
                          ),
        
                          SizedBox(height: 5,),
        
                          Divider(
                            height: 1,
                            color: AppColors.lightBlue,
                            thickness: 1,
                          ),
        
                          SizedBox(height: 30,),
        
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "BMI",
                                      style: TextStyle(
                                          fontSize: 18, fontFamily: 'Comfortaa',fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Chưa có thông tin",
                                    style: TextStyle(
                                        fontSize: 18, fontFamily: 'Comfortaa'),
                                  ),
                                ),
                              ),
                            ],
                          ),
        
                          SizedBox(height: 5,),
        
                          Divider(
                            height: 1,
                            color: AppColors.lightBlue,
                            thickness: 1,
                          ),
        
                          SizedBox(height: 30,),
        
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "BMR",
                                      style: TextStyle(
                                          fontSize: 18, fontFamily: 'Comfortaa',fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Chưa có thông tin",
                                    style: TextStyle(
                                        fontSize: 18, fontFamily: 'Comfortaa'),
                                  ),
                                ),
                              ),
                            ],
                          ),
        
                          SizedBox(height: 5,),
        
                          Divider(
                            height: 1,
                            color: AppColors.lightBlue,
                            thickness: 1,
                          ),
        
                          SizedBox(height: 30,),
        
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Hoạt động",
                                      style: TextStyle(
                                          fontSize: 18, fontFamily: 'Comfortaa',fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Chưa có thông tin",
                                    style: TextStyle(
                                        fontSize: 18, fontFamily: 'Comfortaa'),
                                  ),
                                ),
                              ),
                            ],
                          ),
        
                          SizedBox(height: 5,),
        
                          Divider(
                            height: 1,
                            color: AppColors.lightBlue,
                            thickness: 1,
                          ),
                        ],
                      )
                    )
                  ),
        
                  const SizedBox(height: 20,),
        
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Kiểm tra sức khỏe",
                      style: TextStyle(
                          fontSize: 25,
                          fontFamily: 'Comfortaa',
                          fontWeight: FontWeight.w900),
                    ),
                  ),
        
                  const SizedBox(height: 20,),
        
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: const BorderSide(width: 1, color: Color(0xFFE1E1E1)),
                        ),
                        elevation: 4, 
                        shadowColor:const Color(0x3F000000),
                        backgroundColor: Colors.white,
                      ),
        
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30, right: 10, top: 12, bottom: 12),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              ImageConstant.image_can,
                              width: 40,
                              height: 40,
                            ),
        
                            const SizedBox(width: 30,),
        
                            const Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(top: 5),
                                child: Text(
                                  "Theo dõi cân nặng",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Comfortaa',
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                                ),
                              ),
                            )
        
                          ],
                        ),
                      )
                    ),
                  ),
        
                  const SizedBox(height: 20,),
                  
                  SizedBox(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: const BorderSide(width: 1, color: Color(0xFFE1E1E1)),
                        ),
                        elevation: 4, 
                        shadowColor:const Color(0x3F000000),
                        backgroundColor: Colors.white,
                      ),
        
                      child: Container(
                        padding: const EdgeInsets.only(left: 30, right: 10, top: 12, bottom: 12),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              ImageConstant.image_thuoc_1,
                              width: 40,
                              height: 40,
                            ),
                            const SizedBox(width: 30,),
                            const Expanded(
                              flex: 4,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    "Nhắc nhở uống thuốc",
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: true,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Comfortaa',
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                  ),
                                
                                  SizedBox(height: 5,),
                                      
                                  Text(
                                    "Thuốc đang uống: 0",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'Comfortaa',
                                      color: Color(0xFF979797))
                                  )
                                      
                                ],
                              ),
                            )

                          ],
                        ),
                      )
                    ),
                  ),
                  const SizedBox(height: 20,)
                ],
              ),
            )
          ),
      ));
  }
  void _CapNhatThonTin(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CapNhatThongTinPage()), 
    );
  }
}

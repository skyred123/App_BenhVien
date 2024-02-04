// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:ui_appbenhvien/core/app_export.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ui_appbenhvien/view/cannang/them_so_can_nang.dart';
import 'package:ui_appbenhvien/view/cannang/thong_ke_can_nang.dart';

class TheoDoiCanNangPage extends StatefulWidget {
 

  const TheoDoiCanNangPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TheoDoiCanNangPageState();
  }
}

class _TheoDoiCanNangPageState extends State<TheoDoiCanNangPage> {
  int _selectedIndex = 0;

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: Stack(
        children: [
          BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedIndex,
            onTap: _onItemTap,
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  SVGConstant.thong_ke,
                  height: 20,
                  width: 20,
                  color: _selectedIndex == 0 ? AppColors.mediumDarkBlue : AppColors.grey,
                ),
                label: "Thống kê",
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  SVGConstant.thong_tin,
                  height: 20,
                  width: 20,
                  color: _selectedIndex == 1 ? AppColors.mediumDarkBlue : AppColors.grey,
                ),
                label: "Thông tin",
              ),
            ],
            selectedLabelStyle: const TextStyle(
              color: AppColors.mediumDarkBlue,
              fontFamily: 'Comfortaa',
            ),
            unselectedLabelStyle: const TextStyle(
              color: AppColors.grey,
              fontFamily: 'Comfortaa',
            ),
            selectedItemColor: AppColors.mediumDarkBlue,
          ),
          Positioned(
            bottom: 5,
            left: MediaQuery.of(context).size.width / 2 - 30, // Đặt vị trí của nút cộng
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.mediumDarkBlue,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: IconButton(
                icon: const Icon(Icons.add,color: Colors.white, ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const ThemSoCanNang(); // Hiển thị cửa sổ pop-up ThemSoCanNang()
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    final List<Widget> tabs = [
      const ThongKeCanNangPage(), 
      // const SucKhoe(),
    ];

    return tabs[_selectedIndex];
  }
}

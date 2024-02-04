// ignore_for_file: sized_box_for_whitespace, unnecessary_null_comparison

import 'package:flutter/material.dart';
import '../../core/app_export.dart';

import '../../core/data/models/bac_si.dart';
import '../../core/data/models/benhnhan.dart';
import '../datkham/dat_lich_card.dart';

class ThongTinBacSiPage extends StatefulWidget {
  final BacSi bacsi;
final BenhNhan benhnhan;
  const ThongTinBacSiPage({super.key, required this.bacsi, required this.benhnhan});
  @override
  State<StatefulWidget> createState() {
    return ThongTinBacSiPageState();
  }
}

class ThongTinBacSiPageState extends State<ThongTinBacSiPage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            surfaceTintColor: AppColors.darkBlue,
            pinned: true,
            leadingWidth: double.infinity,
            expandedHeight: 370,
            leading: Container(
                margin: const EdgeInsets.all(10),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.arrow_back),
                    ),
                  ],
                )),
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              collapseMode: CollapseMode.pin,
              title: Container(
                margin: const EdgeInsets.only(right: 40),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        widget.bacsi.hoTen,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: const TextStyle(
                            color: AppColors.darkBlue,
                            fontSize: 20,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                  ],
                ),
              ),
              background: Container(
                height: 420,
                child: Stack(
                  children: [
                    Column(mainAxisSize: MainAxisSize.max, children: [
                      Container(
                        height: 220,
                        width: width,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage(ImageConstant.image_bg_header),
                                fit: BoxFit.fill),
                            borderRadius: const BorderRadiusDirectional.only(
                                bottomStart: Radius.circular(35),
                                bottomEnd: Radius.circular(35))),
                      ),
                    ]),
                    Positioned(
                        left: (width - 175) / 2 + 10,
                        top: 100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100.0),
                          child: Image.asset(
                            ImageConstant.image_iconmeo,
                            fit: BoxFit.fill,
                            width: 175,
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(mainAxisSize: MainAxisSize.max, children: [
              Text(
                'ID: ${widget.bacsi.taiKhoan!.id}',
                style: TextStyle(
                    color: AppColors.BlueText,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                'Chuyên khoa',
                style: TextStyle(
                    color: AppColors.BlueText,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: AppColors.BlueBorder)),
                child: Text(
                  'Tư vấn trực tiếp và Tư vấn từ xa',
                  style: TextStyle(
                      color: AppColors.BlueText,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text('Chi phí khám trong khoản'),
                        Text('Thông tin bác sĩ'),
                        Text('Kinh nghiệm'),
                        Text('Quá trình đào tạo'),
                        Text('Giờ làm việc'),
                      ],
                    )
                  ],
                ),
              )
            ]),
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        surfaceTintColor: Colors.white,
        child: ElevatedButton(
          style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(AppColors.Blue)),
          onPressed: () {
            if (widget.bacsi.ct_lichkhams != null || widget.bacsi.ct_lichkhams.isNotEmpty) {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return DatLichDialog(id: widget.bacsi.id.toString(), benhnhan: widget.benhnhan,);
                                });
                          }
          },
          child: Text('Đặt lịch hẹn',style: TextStyle(
                      color: AppColors.White,
                      fontSize: 18,
                      fontWeight: FontWeight.w900)),
        ),
      ),
    );
  }
}

// ignore_for_file: non_constant_identifier_names, avoid_unnecessary_containers, use_key_in_widget_constructors, camel_case_types

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ui_appbenhvien/view/chat/constants.dart';
import 'package:zego_zimkit/zego_zimkit.dart';
import '../core/app_export.dart';
import '../core/data/models/bac_si.dart';
import '../core/data/models/benhnhan.dart';
import '../core/data/models/tai_khoan.dart';
import '../core/data/repository/bacsi_repository.dart';
import '../core/data/repository/benhnhan_repository.dart';
import '../main.dart';
import 'bacsi/tao_lich_kham.dart';
import 'bacsi/the_bac_si.dart';
import 'bacsi/xac_nhan_kham.dart';
import 'bacsi/xac_nhan_kham2.dart';
import 'chat/home_page.dart';
import 'taikhoan/thong_tin_tai_khoan.dart';
import 'thuoc/thuoc.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class TrangChuPage extends StatefulWidget {
  final TaiKhoan taikhoan;

  const TrangChuPage({super.key, required this.taikhoan});
  @override
  State<StatefulWidget> createState() {
    return _TrangChuPageState();
  }
}

class _TrangChuPageState extends State<TrangChuPage> {
  bool loadData = false;
  late BacSi bacsi;
  late BenhNhan benhnhan;
  List<BacSi> bacsis = [];
  String role = '';
  final int _currentIndex = 0;
  @override
  void initState() {
    super.initState();
    ReloadPage();
  }

  Future<void> ReloadPage() async {
    if (widget.taikhoan.role == 'bacsi') {
      final item = await GetsBacSi();
      if (item != null) {
        bacsi = item;
      }
    } else {
      bacsis = await BacSiRepo().GetsBacSi(widget.taikhoan.jwt);
      final item = await GetsBenhNhan();
      if (item != null) {
        benhnhan = item;
      }
    }
    setState(() {
      loadData = true;
    });
  }

  Future<BacSi?> GetsBacSi() async {
    final list_bacsi = await BacSiRepo().GetsBacSi(widget.taikhoan.jwt);
    final bacsi = list_bacsi.where((bs) {
      if (bs.taiKhoan != null) {
        if (bs.taiKhoan!.id == widget.taikhoan.id) {
          return true;
        }
      }
      return false;
    }).firstOrNull;

    if (bacsi != null && bacsi.taiKhoan != null) {
      bacsi.taiKhoan!.role = widget.taikhoan.role;
      role = widget.taikhoan.role;
      bacsi.taiKhoan!.jwt = widget.taikhoan.jwt;
    }
    return bacsi;
  }

  Future<BenhNhan?> GetsBenhNhan() async {
    final List<BenhNhan> list_BenhNhan =
        await BenhNhanRepo().GetsBenhNhan(widget.taikhoan.jwt);
    final BenhNhan? benhnhan = list_BenhNhan.where((bn) {
      if (bn.taiKhoan != null) {
        if (bn.taiKhoan!.id == widget.taikhoan.id) {
          return true;
        }
      }
      return false;
    }).firstOrNull;

    if (benhnhan != null && benhnhan.taiKhoan != null) {
      benhnhan.taiKhoan!.role = widget.taikhoan.role;
      role = widget.taikhoan.role;
      benhnhan.taiKhoan!.jwt = widget.taikhoan.jwt;
    }
    return benhnhan;
  }

  // Future<String> GetRole(String jwt) async{
  //   return
  // }
  String getGreeting() {
    final now = DateTime.now();
    final hour = now.hour;

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
    final Size size = const Size(40, 40);
    return [
      GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return ThuocPage();
          }));
        },
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
                "Thư viện thuốc",
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
      if (role == 'bacsi')
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return TaoLichKhamPage(
                bacsi: bacsi,
              );
            }));
          },
          child: Column(
            children: [
              Container(
                height: size.height,
                width: size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(ImageConstant.image_tao_lich),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: 200,
                child: Text(
                  "Tạo lịch khám",
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
    if (loadData) {
      return Scaffold(
          appBar: AppBar(
            toolbarHeight: 90,
            //backgroundColor: AppColors.Transparent,
            elevation: 0,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  color: AppColors.BlueBackground),
            ),
            title: BuildTieuDe(context),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (value) async {
              switch (value) {
                case 0:
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          TrangChuPage(taikhoan: widget.taikhoan)));
                  break;
                case 1:
                  
                  await ZIMKit()
                      .connectUser(
                    id: widget.taikhoan.id.toString(),
                    name: widget.taikhoan.username.toString(),
                    avatarUrl:
                        'https://robohash.org/${widget.taikhoan.id.toString()}.png?set=set4',
                  )
                      .then((errorCode) async {
                    if (errorCode == 0) {
                      /// cache login user info
                      final prefs = await SharedPreferences.getInstance();
                      prefs.setString(
                          cacheUserIDKey, widget.taikhoan.id.toString());
                      currentUser.id = widget.taikhoan.id.toString();
                      currentUser.name = widget.taikhoan.username;

                      onUserLogin(widget.taikhoan.id.toString(),
                          widget.taikhoan.username);

                      if (mounted) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const ZIMKitDemoHomePage(),
                          ),
                        );
                      }
                    } else {
                      if (mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'login failed, errorCode: $errorCode',
                            ),
                          ),
                        );
                      }
                    }
                  });

                  break;
                case 2:
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          ThongTinTaiKhoan(taikhoan: widget.taikhoan)));
                  break;
                default:
                  break;
              }
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), label: "Trang chủ"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.chat), label: "Nhắn tin"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: "Thông tin"),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SingleChildScrollView(
                  child: BuildDanhMuc(context),
                ),
                Divider(
                  color: AppColors.BlueDam,
                  thickness: 2,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: BuildBacSi(context),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: BuildKhaoSat(context),
                )
              ],
            ),
          ));
    } else {
      return Container();
    }
  }

  Widget BuildKhaoSat(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.BlueFooter, borderRadius: BorderRadius.circular(30)),
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
                color: AppColors.White,
                fontWeight: FontWeight.w900),
          ),
          Text(
            "Ý kiến của bạn sẽ giúp đội ngũ lập trình\n phát triển ứng dụng tốt hơn!",
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontSize: 14,
                color: AppColors.White,
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
                              color: AppColors.BlueFooter,
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
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Wrap(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 6, left: 20, right: 10),
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
      ),
    );
  }

  Widget BuilListCard(BuildContext context) {
    print(bacsis.length);
    return Wrap(spacing: 20, runSpacing: 20, children: [
      for (var item in bacsis)
        TheBacSiCard(
          bacsi: item,
          benhnhan: benhnhan,
          jwt: widget.taikhoan.jwt,
        ),
    ]);
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
                    width: 260,
                    child: Text(
                      getGreeting(),
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 13, color: AppColors.BlueText),
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    child: Text(
                      widget.taikhoan.username,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: AppColors.BlueText,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ]),
            GestureDetector(
              onTap: () {
                if (role == 'bacsi') {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => XacNhanKhamPage2(
                            bacsi: bacsi,
                            role: role,
                          )));
                } else {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => XacNhanKhamPage(
                            taiKhoan: widget.taikhoan,
                            role: role,
                          )));
                }
              },
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: AppColors.BlueDam,
                    borderRadius: BorderRadius.circular(100)),
                child: Icon(
                  Icons.notifications_none,
                  color: AppColors.White,
                  size: 30,
                ),
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

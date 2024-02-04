import 'package:flutter/material.dart';
import 'package:ui_appbenhvien/core/app_export.dart';

import 'thong_tin_thuoc.dart';

class ThuocPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ThuocPageState();
  }
}

class ThuocPageState extends State<ThuocPage> {
  bool loadData = false;
  TextEditingController timkiemController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      loadData = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (loadData) {
      return Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              shadowColor: AppColors.darkBlue,
              backgroundColor: AppColors.BlueBackground,
              pinned: true,
              leadingWidth: double.infinity,
              expandedHeight: 200,
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
                  child: const Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          "Thư viện thuốc",
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                              color: AppColors.darkBlue,
                              fontSize: 20,
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                    ],
                  ),
                ),
                background: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(ImageConstant.image_bg_thuoc),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
                child: LayoutBuilder(builder: (context, constraints) {
              return Column(mainAxisSize: MainAxisSize.max, children: [
                Padding(
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
                          Container(
                            width: constraints.maxWidth - 30,
                            padding: EdgeInsets.all(5),
                            margin: EdgeInsets.only(bottom: 5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all()),
                            child: TextField(
                              controller: timkiemController,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                hintText: 'Tìm kiếm',
                                filled: true,
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                              ),
                            ),
                          ),
                          SizedBox(height: 10,),
                          for (int i = 0; i < 1; i++)
                            Container(
                              width: constraints.maxWidth - 30,
                              padding: EdgeInsets.all(15),
                              margin: EdgeInsets.only(bottom: 5),
                              decoration: BoxDecoration(
                                border: Border(
                                  top: BorderSide(
                                      width: 1.0,
                                      color: Colors
                                          .grey), // Màu sắc và độ dày của border
                                ),
                              ),
                              child: GestureDetector(
                                onTap: (){
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => ThongTinThuocPage()));
                                },
                                child: Text(
                                  "Panadol xanh",
                                  style: TextStyle(),
                                ),
                              ),
                            )
                        ],
                      )
                    ],
                  ),
                )
              ]);
            }))
          ],
        ),
      );
    } else {
      return Container();
    }
  }
}

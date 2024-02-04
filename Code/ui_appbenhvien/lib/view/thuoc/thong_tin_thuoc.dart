
// ignore_for_file: library_private_types_in_public_api, omit_local_variable_types

import 'package:flutter/material.dart';

import '../../core/app_export.dart';

class ThongTinThuocPage extends StatefulWidget {
  const ThongTinThuocPage({Key? key}) : super(key: key);

  @override
  _ThongTinThuocPageState createState() => _ThongTinThuocPageState();
}

class _ThongTinThuocPageState extends State<ThongTinThuocPage> {
  final ScrollController _scrollController = ScrollController();

  // Create a list of GlobalKey to track the height of each section
  List<GlobalKey> sectionKeys = List.generate(7, (index) => GlobalKey());

  @override
  void initState() {
    super.initState();
  }

  void _scrollToSection(int index) {
    //double sectionHeight = sectionKeys[index].currentContext?.size?.height ?? 0;
    double offset = 0;

    for (int i = 0; i < index; i++) {
      offset += sectionKeys[i].currentContext?.size?.height ?? 0;
    }

    _scrollController.animateTo(offset, duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'THUỐC VÀ THỰC PHẨM CHỨC NĂNG',
                  style: TextStyle(
                    
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                    color: AppColors.mediumDarkBlue,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Panadol xanh',
                  style: TextStyle(
                    
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    // Handle tap if needed
                  },
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFFEFEFEF),
                            border: Border.all(
                              width: 1,
                              color: const Color.fromARGB(255, 209, 207, 207),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                            child: Column(
                              children: [
                                const Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Mục lục',
                                    style: TextStyle(
                                      
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                buildListTile('Tác dụng', 0, sectionKeys[0]),
                                buildListTile('Liều dùng', 1, sectionKeys[1]),
                                buildListTile('Tác dụng phụ', 2, sectionKeys[2]),
                                buildListTile('Thận trọng/Cảnh báo', 3, sectionKeys[3]),
                                buildListTile('Tương tác thuốc', 4, sectionKeys[4]),
                                buildListTile('Khẩn cấp', 5, sectionKeys[5]),
                                buildListTile('Bảo quản', 6, sectionKeys[6]),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 50,),
                        Column(
                          key: sectionKeys[0],
                          children: const [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Tác dụng',
                                style: TextStyle(
                                  fontSize: 20,
                                  
                                  fontWeight: FontWeight.w900
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Giảm đau, hạ sốt do cảm lạnh, cúm, đau dạ dày, đau bụng kinh, đau răng, đau đầu, đau cơ xương khớp.',
                                style: TextStyle(
                                  fontSize: 16,
                                  
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                        Column(
                          key: sectionKeys[1],
                          children: const [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Liều dùng',
                                style: TextStyle(
                                  fontSize: 20,
                                  
                                  fontWeight: FontWeight.w900
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Người lớn và trẻ em trên 12 tuổi: 1-2 viên, cách 4-6 giờ nếu cần. Không quá 8 viên/ngày.Trẻ em 6-12 tuổi: 1 viên, cách 4-6 giờ nếu cần. Không quá 4 viên/ngày.',
                                style: TextStyle(
                                  fontSize: 16,
                                  
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                        Column(
                          key: sectionKeys[2],
                          children: const [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Tác dụng phụ',
                                style: TextStyle(
                                  fontSize: 20,
                                  
                                  fontWeight: FontWeight.w900
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Buồn nôn, nôn, ỉa chảy, đau bụng, mệt mỏi, chóng mặt.',
                                style: TextStyle(
                                  fontSize: 16,
                                  
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                        Column(
                          key: sectionKeys[3],
                          children: const [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Thận trọng + Cảnh báo',
                                style: TextStyle(
                                  fontSize: 20,
                                  
                                  fontWeight: FontWeight.w900
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                ' Không dùng cho người bị suy gan, thiếu men G6PD, dị ứng với paracetamol. Không dùng quá liều hoặc thời gian dài.',
                                style: TextStyle(
                                  fontSize: 16,
                                  
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),

                        Column(
                          key: sectionKeys[4],
                          children: const [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Tương tác thuốc',
                                style: TextStyle(
                                  fontSize: 20,
                                  
                                  fontWeight: FontWeight.w900
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Tăng nguy cơ ngộ độc khi dùng chung với rượu. Giảm tác dụng khi dùng với probenecid.',
                                style: TextStyle(
                                  fontSize: 16,
                                  
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),

                        Column(
                          key: sectionKeys[5],
                          children: const [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Khẩn cấp',
                                style: TextStyle(
                                  fontSize: 20,
                                  
                                  fontWeight: FontWeight.w900
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Ngộ độc paracetamol cần được xử trí kịp thời bằng thuốc giải độc.',
                                style: TextStyle(
                                  fontSize: 16,
                                  
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                        Column(
                          key: sectionKeys[6],
                          children: const [
                           Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Bảo quản',
                                style: TextStyle(
                                  fontSize: 20,
                                  
                                  fontWeight: FontWeight.w900
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Nơi khô ráo, thoáng mát, tránh ẩm ướt và ánh nắng trực tiếp.',
                                style: TextStyle(
                                  fontSize: 16,
                                  
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildListTile(String title, int index, GlobalKey key) {
    return ListTile(
      title: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            _scrollToSection(index);
          },
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              color: AppColors.mediumDarkBlue,
            ),
          ),
        ),
      ),
    );
  }
}

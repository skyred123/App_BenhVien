import 'package:flutter/material.dart';
import 'package:ui_appbenhvien/core/app_export.dart';
import 'package:ui_appbenhvien/core/data/models/benhnhan.dart';
import 'package:ui_appbenhvien/core/data/models/tai_khoan.dart';
import 'package:ui_appbenhvien/core/data/repository/benhnhan_repository.dart';
import 'package:ui_appbenhvien/core/data/repository/taikhoan_repository.dart';

class CapNhatThongTinTaiKhoanPage extends StatefulWidget {
  final TaiKhoan taikhoan;

  const CapNhatThongTinTaiKhoanPage({Key? key, required this.taikhoan})
      : super(key: key);
  @override
  _CapNhatThongTinTaiKhoanPageState createState() =>
      _CapNhatThongTinTaiKhoanPageState();
}

class _CapNhatThongTinTaiKhoanPageState
    extends State<CapNhatThongTinTaiKhoanPage> {
  bool loadData = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  bool isMale = false;
  bool isFemale = false;
  DateTime selectedDate = DateTime.now();
  late BenhNhan benhnhan;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ReloadPage();
  }

  void ReloadPage() async {
    if (widget.taikhoan.role == 'bacsi') {
      // BacSi? item = await GetsBacSi();
      // if (item != null) {
      //   bacsi = item;
      // }
    } else {
      BenhNhan? item = await GetsBenhNhan();
      if (item != null) {
        benhnhan = item;
        nameController.text = benhnhan.hoTen;

        if (benhnhan.gioiTinh) {
          isMale = true;
          isFemale = false;
        } else {
          isMale = false;
          isFemale = true;
        }
        selectedDate = benhnhan.ngaysinh;
        addressController.text = benhnhan.diachi;
      }
    }
    setState(() {
      loadData = true;
    });
  }

  Future<BenhNhan?> GetsBenhNhan() async {
    List<BenhNhan> list_BenhNhan =
        await BenhNhanRepo().GetsBenhNhan(widget.taikhoan.jwt);
    BenhNhan? benhnhan = list_BenhNhan.where((bn) {
      if (bn.taiKhoan != null) {
        if (bn.taiKhoan!.id == widget.taikhoan.id) {
          return true;
        }
      }
      return false;
    }).firstOrNull;

    if (benhnhan != null && benhnhan.taiKhoan != null) {
      benhnhan.taiKhoan!.role = widget.taikhoan.role;
      benhnhan.taiKhoan!.jwt = widget.taikhoan.jwt;
    }
    return benhnhan;
  }

  @override
  Widget build(BuildContext context) {
    if (loadData) {
      return Scaffold(
        backgroundColor: AppColors.lightBlue,
        appBar: AppBar(
          title: const Text(
            'Cập nhật thông tin',
            style:
                TextStyle(fontFamily: "Comfortaa", fontWeight: FontWeight.w900),
          ),
          backgroundColor: AppColors.lightBlue,
        ),
        body: Padding(padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              // TextField(
              //   controller: nameController,
              //   decoration: const InputDecoration(
              //     labelText: 'Họ tên',
              //   ),
              //   // onChanged: (value) {
              //   //   userInformation.fullName = value;
              //   // },
              // ),
              const Text('Họ tên',
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Comfortaa',
                      fontWeight: FontWeight.w900)),
              const SizedBox(
                height: 10,
              ),

              Container(
                height: 55,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 1, color: AppColors.darkBlue),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, top: 2),
                    child: TextField(
                      keyboardType: TextInputType.name,
                      controller: nameController,
                      onChanged: (value) {
                        //   userInformation.fullName = value;
                      },
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Nhập họ tên",
                      ),
                      cursorColor: AppColors.darkBlue,
                      style: const TextStyle(
                          fontSize: 18, fontFamily: 'Comfortaa'),
                    ),
                  ),
                ),
              ),

              const SizedBox(
                height: 10,
              ),
              const Text('Giới tính',
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Comfortaa',
                      fontWeight: FontWeight.w900)),
              Row(
                children:[
                  Checkbox(
                    activeColor: AppColors.darkBlue,
                    value: isMale,
                    onChanged: (value) {
                      setState(() {
                        isMale = value!;
                        if (isMale) {
                          isFemale = false;
                        }
                      });
                    },
                  ),
                  const Text(
                    'Nam',
                    style: TextStyle(fontSize: 16, fontFamily: 'Comfortaa'),
                  ),
                  Checkbox(
                    activeColor: AppColors.darkBlue,
                    value: isFemale,onChanged: (value) {
                      setState(() {
                        isFemale = value!;
                        if (isFemale) {
                          isMale = false;
                        }
                      });
                    },
                  ),
                  const Text(
                    'Nữ',
                    style: TextStyle(fontSize: 16, fontFamily: 'Comfortaa'),
                  ),
                ],
              ),
              const Text('Ngày sinh',
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Comfortaa',
                      fontWeight: FontWeight.w900)),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 55,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 1, color: AppColors.darkBlue),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: GestureDetector(
                  onTap: () {
                    _selectDate(context); // Chọn ngày sinh
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15, left: 15),
                    child: Text(
                      "${selectedDate.toLocal()}".split(' ')[0],
                      style: const TextStyle(
                          fontSize: 18, fontFamily: 'Comfortaa'),
                    ),
                  ),
                ),
              ),

              const SizedBox(
                height: 10,
              ),
              const Text('Địa chỉ',
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Comfortaa',
                      fontWeight: FontWeight.w900)),
              const SizedBox(
                height: 10,
              ),

              Container(
                height: 55,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 1, color: AppColors.darkBlue),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, top: 2),
                    child: TextField(
                      keyboardType: TextInputType.name,
                      controller: addressController,
                      onChanged: (value) {
                        //   userInformation.address = value;
                      },
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Nhập địa chỉ",
                      ),
                      cursorColor: AppColors.darkBlue,
                      style: const TextStyle(fontSize: 18, fontFamily: 'Comfortaa'),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      backgroundColor: AppColors.darkBlue,
                    ),
                    onPressed: () {
                      CapNhatTaiKhoan();
                    },
                    child: const Text(
                      'Lưu thông tin',
                      style: TextStyle(fontSize: 18, fontFamily: 'Comfortaa', color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  void CapNhatTaiKhoan() async {
    bool sex = true;
    if (isMale == false) {
      sex = false;
    }
    var data = <String, dynamic>{'username': nameController.text};
    var result = await TaiKhoanRepo().PutTaiKhoan(benhnhan.id.toString(), data);

    data = <String, dynamic>{
      'data': {
        'HoTen': nameController.text,
        'GioiTinh': sex,
        'NgaySinh': selectedDate.toString(),
        'DiaChi': addressController.text,
      }
    };
    result = await BenhNhanRepo().PutBenhNhan(
        benhnhan.id.toString(),
        "4819751bf816349627f7f604e5634ada16fe02dbcdf2e0eb07a3cccb2540b8ea53f51931248e74d2be3e94c7d057f670c99ce797304664b15ef5b840dc2ac068f9aa7a91092e1995fa7fcd52343f375649529ae371827b824b806160f290890138d970d6f68d5fbf3ab231cae76585224f6403f60f9d4ba1371e3e9d27609e96",
        data);
    print(result.toString());
  }
}

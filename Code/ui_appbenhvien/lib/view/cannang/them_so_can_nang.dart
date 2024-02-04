import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:ui_appbenhvien/core/app_export.dart';

class ThemSoCanNang extends StatefulWidget {
  const ThemSoCanNang({Key? key}) : super(key: key);

  @override
  State<ThemSoCanNang> createState() => _ThemSoCanNangState();
}

class _ThemSoCanNangState extends State<ThemSoCanNang> {
  DateTime date = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  String getHourIn12HourFormat(int hour) {
    if (hour == 0) {
      return '12';
    } else if (hour < 12) {
      return '$hour';
    } else if (hour == 12) {
      return '12';
    } else {
      return '${hour - 12}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                  child: Text(
                    "Thêm số đo cân nặng",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Comfortaa',
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.close, size: 25),
                ),
              ],
            ),
            const SizedBox(height: 15.0),
            Padding(
                padding: const EdgeInsets.only(left: 8, right: 8, bottom: 20),
                child: LayoutBuilder(builder: ((context, constraints) {
                  return SizedBox(
                    width: constraints.maxWidth,
                    child: Wrap(
                      alignment: WrapAlignment.spaceBetween,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Row(mainAxisSize: MainAxisSize.min, children: [
                            ShaderMask(
                              shaderCallback: (Rect bounds) {
                                return const LinearGradient(
                                  colors: [
                                    Color(0xFF1CD9B9),
                                    AppColors.mediumDarkBlue
                                  ], // Màu xanh -> đỏ
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ).createShader(bounds);
                              },
                              blendMode: BlendMode.srcATop,
                              child: SvgPicture.asset(
                                SVGConstant.lich,
                                width: 30,
                                height: 30,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              DateFormat("dd/MM/yyy").format(date),
                              style: const TextStyle(
                                fontFamily: 'Comfortaa',
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ]),
                        ),
                        // Hour
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ShaderMask(
                                shaderCallback: (Rect bounds) {
                                  return const LinearGradient(
                                    colors: [
                                      Color(0xFF1CD9B9),
                                      AppColors.mediumDarkBlue
                                    ], // Màu xanh -> đỏ
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  ).createShader(bounds);
                                },
                                blendMode: BlendMode.srcATop,
                                child: SvgPicture.asset(
                                  SVGConstant.dong_ho,
                                  width: 23,
                                  height: 23,
                                ),
                              ),
                              Text(DateFormat('h:mm a').format(date),
                              overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontFamily: 'Comfortaa',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }))),
            Padding(
              padding: const EdgeInsets.only(
                  top: 10, left: 15, right: 15, bottom: 15),
              child: Column(
                children: [
                  const Text(
                    "Chỉ số cân nặng của bạn là:",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Comfortaa',
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 70,
                      ),
                      Expanded(
                        flex: 50,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: TextField(
                            keyboardType: const TextInputType.numberWithOptions(
                                decimal: true),
                            onChanged: (value) {},
                            textAlign: TextAlign.right, // căn lề về bên phải
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: '00.0',
                              errorBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              focusedErrorBorder: InputBorder.none,
                              contentPadding: EdgeInsets.zero,
                              isDense: true,
                            ),
                            style: const TextStyle(
                              fontSize: 40,
                              fontFamily: 'Comfortaa',
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ),
                      const Expanded(
                        flex: 50,
                        child: Text(
                          "kg",
                          style: TextStyle(
                            fontSize: 25,
                            fontFamily: 'Comfortaa',
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      backgroundColor: AppColors.mediumDarkBlue,
                    ),
                    child: const Text(
                      'Cập nhật',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Comfortaa',
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

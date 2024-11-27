import 'dart:math';

import 'package:aquaculture_pond_monitoring/presentation/widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

class ReportDetailsView extends StatelessWidget {
  final String area, sensor, issue, time;
  final Widget status, priority;

  const ReportDetailsView(
      {super.key,
      required this.area,
      required this.sensor,
      required this.issue,
      required this.status,
      required this.priority,
      required this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 211, 218, 218),
        borderRadius: BorderRadiusDirectional.vertical(
          top: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Stack(
                  children: [
                    Center(
                      child: AppText(
                        'Chi tiết cảnh báo',
                        color: Colors.black.withOpacity(0.85),
                      ),
                    ),
                    const Align(
                      alignment: Alignment.centerRight,
                      child: Icon(
                        PhosphorIcons.x_bold,
                        size: 16,
                        color: Colors.redAccent,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Container(
                  height: 1,
                  color: Colors.black38,
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 120,
                        child: AppText(
                          'ID: ',
                          color: Colors.black.withOpacity(0.7),
                          fontWeight: FontWeight.w500,
                          fontSize: 15.5,
                        ),
                      ),
                      AppText(
                        '#${Random().nextInt(9999)}',
                        color: Colors.black.withOpacity(0.85),
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      SizedBox(
                        width: 120,
                        child: AppText(
                          'Khu vực: ',
                          color: Colors.black.withOpacity(0.7),
                          fontWeight: FontWeight.w500,
                          fontSize: 15.5,
                        ),
                      ),
                      AppText(
                        area,
                        color: Colors.black.withOpacity(0.75),
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      SizedBox(
                        width: 120,
                        child: AppText(
                          'Sensor: ',
                          color: Colors.black.withOpacity(0.7),
                          fontWeight: FontWeight.w500,
                          fontSize: 15.5,
                        ),
                      ),
                      AppText(
                        sensor,
                        color: Colors.black.withOpacity(0.75),
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      SizedBox(
                        width: 120,
                        child: AppText(
                          'Vấn đề: ',
                          color: Colors.black.withOpacity(0.7),
                          fontWeight: FontWeight.w500,
                          fontSize: 15.5,
                        ),
                      ),
                      AppText(
                        issue,
                        color: const Color.fromARGB(255, 131, 82, 8),
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      SizedBox(
                        width: 120,
                        child: AppText(
                          'Mức độ: ',
                          color: Colors.black.withOpacity(0.7),
                          fontWeight: FontWeight.w500,
                          fontSize: 15.5,
                        ),
                      ),
                      priority,
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      SizedBox(
                        width: 120,
                        child: AppText(
                          'Trạng thái: ',
                          color: Colors.black.withOpacity(0.7),
                          fontWeight: FontWeight.w500,
                          fontSize: 15.5,
                        ),
                      ),
                      status,
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 120,
                        child: AppText(
                          'Phân công: ',
                          color: Colors.black.withOpacity(0.7),
                          fontWeight: FontWeight.w500,
                          fontSize: 15.5,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            'Tiêu Trung Lập ',
                            color: Colors.black.withOpacity(0.85),
                            fontWeight: FontWeight.w500,
                          ),
                          AppText(
                            ' (Kỷ Thuật Viên)',
                            color: Colors.black.withOpacity(0.6),
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      SizedBox(
                        width: 120,
                        child: AppText(
                          'Ghi chú: ',
                          color: Colors.black.withOpacity(0.7),
                          fontWeight: FontWeight.w500,
                          fontSize: 15.5,
                        ),
                      ),
                      AppText(
                        'N/A',
                        color: Colors.black.withOpacity(0.7),
                        fontWeight: FontWeight.w400,
                        fontSize: 15.5,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 120,
                        child: AppText(
                          'Ngày tạo ',
                          color: Colors.black.withOpacity(0.7),
                          fontWeight: FontWeight.w500,
                          fontSize: 15.5,
                        ),
                      ),
                      AppText(
                        'Hôm nay - $time',
                        color: Colors.black.withOpacity(0.7),
                        fontWeight: FontWeight.w400,
                        fontSize: 15.5,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 120,
                        child: AppText(
                          'Ngày cập nhật:',
                          color: Colors.black.withOpacity(0.7),
                          fontWeight: FontWeight.w500,
                          fontSize: 14.5,
                        ),
                      ),
                      AppText(
                        'Hôm nay - $time',
                        color: Colors.black.withOpacity(0.7),
                        fontWeight: FontWeight.w400,
                        fontSize: 15.5,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                      colors: [Colors.cyanAccent, Colors.blueAccent]),
                  borderRadius: BorderRadius.circular(8),
                ),
                height: 40,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText(
                      'C Ậ P   N H Ậ T',
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

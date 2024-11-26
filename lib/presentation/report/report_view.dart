import 'dart:math';

import 'package:aquaculture_pond_monitoring/presentation/widget/bottom_bar_widget.dart';
import 'package:aquaculture_pond_monitoring/presentation/widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

class ReportView extends StatefulWidget {
  const ReportView({super.key});

  @override
  State<ReportView> createState() => _ReportViewState();
}

class _ReportViewState extends State<ReportView> {
  @override
  Widget build(BuildContext context) {
    final topBar = Container(
      decoration: const BoxDecoration(
          gradient:
              LinearGradient(colors: [Colors.cyanAccent, Colors.blueAccent])),
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Row(
          children: [
            const Icon(
              PhosphorIcons.fish_bold,
              size: 17,
              color: Color.fromARGB(255, 23, 29, 29),
            ),
            const SizedBox(width: 4),
            const AppText(
              'AP-MONITORING',
              fontSize: 13,
              color: Color.fromARGB(255, 23, 29, 29),
            ),
            const Spacer(),
            Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 23, 29, 29),
                borderRadius: BorderRadius.circular(100),
              ),
              child: const Icon(
                PhosphorIcons.bell_bold,
                size: 16,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );

    var total = 0;

    final ran = List.generate(
      5,
      (index) {
        final value = Random().nextInt(99);
        total += value;
        return value;
      },
    );

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 23, 29, 29),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              topBar,
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    const AppText(
                      'Thời gian: ',
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                      color: Colors.white70,
                    ),
                    AppText(
                      'Hôm nay',
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Colors.white.withOpacity(0.85),
                    ),
                    const SizedBox(width: 16),
                    const AppText(
                      'Sắp xếp: ',
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                      color: Colors.white70,
                    ),
                    AppText(
                      'Mới nhất',
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Colors.white.withOpacity(0.85),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          gradient: const LinearGradient(
                              colors: [Colors.cyanAccent, Colors.blueAccent])),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 211, 211, 211),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 4),
                        child: const Row(
                          children: [
                            AppText(
                              'Bộ lọc',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87,
                            ),
                            SizedBox(width: 4),
                            Icon(
                              PhosphorIcons.sliders_horizontal_bold,
                              size: 16,
                              color: Colors.black87,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 24,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  children: [
                    'Tất cả',
                    'Chờ xử lý',
                    'Đang xử lý',
                    'Đã khắc phục',
                    'Tạm hoãn',
                    'Đã đóng',
                  ].asMap().entries.map(
                    (e) {
                      final selected = e.value == 'Tất cả';

                      return Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(left: 10),
                        child: Row(
                          children: [
                            AppText(
                              e.value,
                              fontWeight:
                                  selected ? FontWeight.w500 : FontWeight.w400,
                              fontSize: 14,
                              color:
                                  selected ? Colors.cyanAccent : Colors.white70,
                            ),
                            const SizedBox(width: 8),
                            Container(
                              height: 16,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color:
                                      selected ? Colors.cyan : Colors.white24),
                              child: AppText(
                                selected ? '$total' : '${ran[e.key - 1]}',
                                fontWeight: selected
                                    ? FontWeight.w600
                                    : FontWeight.w400,
                                fontSize: 10,
                                color: Colors.white70,
                              ),
                            ),
                            if (selected)
                              Container(
                                color: Colors.white54,
                                width: 1,
                                margin: const EdgeInsets.only(
                                    left: 10, top: 4, bottom: 4),
                              ),
                          ],
                        ),
                      );
                    },
                  ).toList(),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  itemBuilder: (context, index) => Container(
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.cyanAccent),
                        color: const Color.fromARGB(255, 206, 227, 230),
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            AppText(
                              'Sensor nhiệt độ #0${Random().nextInt(10) + 1} - Hồ cá tra #0${Random().nextInt(4) + 1}',
                              fontWeight: FontWeight.w500,
                              color: Colors.black.withOpacity(0.7),
                              fontSize: 14,
                            ),
                            const Spacer(),
                            Builder(builder: (context) {
                              final selected = Random().nextBool();

                              return Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black38,
                                  ),
                                  borderRadius: BorderRadius.circular(100),
                                  gradient: selected
                                      ? const LinearGradient(
                                          colors: [
                                            Colors.cyan,
                                            Colors.blue,
                                          ],
                                        )
                                      : null,
                                ),
                                child: selected
                                    ? const Icon(
                                        PhosphorIcons.check_bold,
                                        size: 13,
                                        color: Colors.white,
                                      )
                                    : SizedBox.fromSize(),
                              );
                            }),
                          ],
                        ),
                        Builder(builder: (context) {
                          final hot = Random().nextBool();
                          final tmp =
                              (hot ? 32 : 28) - (Random().nextInt(19) / 10);

                          return AppText(
                            'Nhiệt độ hồ quá ${hot ? 'nóng' : 'lạnh'}: ${tmp.toStringAsFixed(1)}°C',
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          );
                        }),
                        Container(
                          color: Colors.black26,
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          height: 1,
                        ),
                        Row(
                          children: [
                            const AppText(
                              'Hôm nay',
                              fontWeight: FontWeight.w500,
                              color: Colors.black87,
                              fontSize: 13,
                            ),
                            const SizedBox(width: 8),
                            Builder(builder: (context) {
                              final m = Random().nextInt(60);
                              final h = max(12 - index, 1);

                              return AppText(
                                '${h < 10 ? '0' : ''}$h:${m < 10 ? '0' : ''}$m PM',
                                fontWeight: FontWeight.w700,
                                color: Colors.black54,
                                fontSize: 12,
                              );
                            }),
                            const Spacer(),
                            Builder(builder: (context) {
                              final status = Random().nextInt(5) + 1;

                              final String text;
                              final Color color;

                              switch (status) {
                                case 1:
                                  text = 'Chờ xử lý';
                                  color = Colors.black87;
                                  break;
                                case 2:
                                  text = 'Đang xử lý';
                                  color = Colors.orange;
                                  break;
                                case 3:
                                  text = 'Đã khắc phục';
                                  color = Colors.cyan;
                                  break;
                                case 4:
                                  text = 'Tạm hoãn';
                                  color = Colors.deepOrangeAccent;
                                  break;
                                case 5:
                                  text = 'Đã đóng';
                                  color = Colors.blueAccent;
                                  break;
                                default:
                                  text = 'N/A';
                                  color = Colors.black87;
                              }

                              return Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 4, horizontal: 8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: color),
                                  color: Colors.white,
                                ),
                                child: AppText(
                                  text,
                                  fontWeight: FontWeight.w500,
                                  color: color,
                                  fontSize: 13,
                                ),
                              );
                            }),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const BottomBarWidget(selected: 2),
        ],
      ),
    );
  }
}

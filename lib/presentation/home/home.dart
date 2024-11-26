import 'package:aquaculture_pond_monitoring/presentation/widget/bottom_bar_widget.dart';
import 'package:aquaculture_pond_monitoring/presentation/home/widget/item_widget.dart';
import 'package:aquaculture_pond_monitoring/presentation/widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

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

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 23, 29, 29),
      body: Stack(
        children: [
          Column(
            children: [
              // const SizedBox(height: 8),
              // const AppText('Xin chào Bình  👋'),
              topBar,
              Expanded(
                child: SingleChildScrollView(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          AppText(
                            'Loại hồ',
                            color: Colors.white.withOpacity(0.9),
                            fontSize: 15,
                          ),
                          const Spacer(),
                          const AppText(
                            'Xem tất cả',
                            color: Colors.white70,
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                          ),
                          const Icon(
                            Icons.arrow_right,
                            color: Colors.white70,
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 206, 227, 230),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.cyanAccent)),
                        child: const Row(
                          children: [
                            AppText(
                              'Hồ cá Basa - #01 ',
                              color: Colors.black87,
                              fontWeight: FontWeight.w500,
                            ),
                            Spacer(),
                            Icon(
                              Icons.arrow_drop_down,
                              color: Colors.black87,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          AppText(
                            'Loại sensor',
                            color: Colors.white.withOpacity(0.9),
                            fontSize: 15,
                          ),
                          const Spacer(),
                          const AppText(
                            'Xem tất cả',
                            color: Colors.white70,
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                          ),
                          const Icon(
                            Icons.arrow_right,
                            color: Colors.white70,
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 206, 227, 230),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.cyanAccent)),
                        child: const Row(
                          children: [
                            AppText(
                              'Sensor môi trường- #01',
                              color: Colors.black87,
                              fontWeight: FontWeight.w500,
                            ),
                            Spacer(),
                            Icon(
                              Icons.arrow_drop_down,
                              color: Colors.black87,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      AppText(
                        'Thông số',
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 15,
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(
                              child: Column(
                            children: [
                              ItemWidget(
                                minValue: 24,
                                maxValue: 34,
                                getValueText: (value) =>
                                    '${value.toStringAsFixed(1)}°',
                                getDescription: (value) {
                                  final String text;
                                  final IconData icon;
                                  final Color color;

                                  if (value < 28) {
                                    text = 'Lạnh';
                                    icon = PhosphorIcons.thermometer_cold_bold;
                                    color = Colors.blueAccent;
                                  } else if (value > 30) {
                                    text = 'Nóng';
                                    icon = PhosphorIcons.thermometer_hot_bold;
                                    color = Colors.redAccent;
                                  } else {
                                    text = 'Ổn định';
                                    icon = PhosphorIcons.thermometer_bold;
                                    color = Colors.cyan;
                                  }

                                  return Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      AppText(
                                        text,
                                        fontSize: 14,
                                        color: color,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      const SizedBox(width: 4),
                                      Icon(
                                        icon,
                                        size: 16,
                                        color: color,
                                      ),
                                    ],
                                  );
                                },
                              ),
                              const SizedBox(height: 10),
                              AppText(
                                'Nhiệt Độ (°C)',
                                color: Colors.white.withOpacity(0.9),
                                fontSize: 15,
                              ),
                            ],
                          )),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              children: [
                                ItemWidget(
                                  minValue: 0,
                                  maxValue: 14,
                                  getValueText: (value) =>
                                      value.toStringAsFixed(1),
                                  getDescription: (value) {
                                    final String text;
                                    final IconData icon;
                                    final Color color;

                                    if (value < 3.5) {
                                      text = 'Kềm';
                                      icon = PhosphorIcons.x_bold;
                                      color = Colors.purpleAccent;
                                    } else if (value > 9) {
                                      text = 'Ổn định';
                                      icon = PhosphorIcons.x_bold;
                                      color = Colors.redAccent;
                                    } else {
                                      text = 'Trung tính';
                                      icon = PhosphorIcons.check_bold;
                                      color = Colors.cyan;
                                    }

                                    return Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        AppText(
                                          text,
                                          fontSize: 14,
                                          color: color,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        const SizedBox(width: 4),
                                        Icon(
                                          icon,
                                          size: 16,
                                          color: color,
                                        ),
                                      ],
                                    );
                                  },
                                ),
                                const SizedBox(height: 10),
                                AppText(
                                  'Độ pH',
                                  color: Colors.white.withOpacity(0.9),
                                  fontSize: 15,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                              child: Column(
                            children: [
                              // ItemWidget('3.5', 'Ổn định'),
                              ItemWidget(
                                minValue: 2.5,
                                maxValue: 6,
                                getValueText: (value) =>
                                    value.toStringAsFixed(1),
                                getDescription: (value) {
                                  final String text;
                                  final IconData icon;
                                  final Color color;

                                  if (value < 3.5) {
                                    text = 'Thiếu hụt';
                                    icon = PhosphorIcons.x_bold;
                                    color = Colors.redAccent;
                                  } else {
                                    text = 'Ổn định';
                                    icon = PhosphorIcons.check_bold;
                                    color = Colors.cyan;
                                  }

                                  return Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      AppText(
                                        text,
                                        fontSize: 14,
                                        color: color,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      const SizedBox(width: 4),
                                      Icon(
                                        icon,
                                        size: 16,
                                        color: color,
                                      ),
                                    ],
                                  );
                                },
                              ),
                              const SizedBox(height: 10),
                              AppText(
                                'Độ Oxygen (mg/L)',
                                color: Colors.white.withOpacity(0.9),
                                fontSize: 15,
                              ),
                            ],
                          )),
                          const SizedBox(width: 12),
                          const Spacer(),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          const BottomBarWidget(selected: 1),
        ],
      ),
    );
  }
}

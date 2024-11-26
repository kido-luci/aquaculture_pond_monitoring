import 'package:aquaculture_pond_monitoring/presentation/widget/bottom_bar_widget.dart';
import 'package:aquaculture_pond_monitoring/presentation/widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              topBar,
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 35,
                          backgroundImage: NetworkImage(
                              'https://i.pinimg.com/736x/18/99/01/18990123c51db466db6d521cd41b9a5b.jpg'),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  AppText('Trương Thanh Bình'),
                                  Spacer(),
                                  Icon(
                                    PhosphorIcons.pencil_line,
                                    color: Colors.white70,
                                    size: 18,
                                  ),
                                ],
                              ),
                              SizedBox(height: 2),
                              AppText(
                                '(Quản lý)',
                                color: Colors.white70,
                                fontSize: 14,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 25),
                    const Row(
                      children: [
                        AppText('Quản lý hồ'),
                        Spacer(),
                        AppText(
                          'Xem tất cả',
                          color: Colors.white70,
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        ),
                        Icon(
                          Icons.arrow_right,
                          color: Colors.white70,
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: List.generate(
                        6,
                        (index) => Container(
                          height: 110,
                          width: 110,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 206, 227, 230),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                width: 1.5,
                                color: Colors.cyanAccent,
                              ),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.white12,
                                    blurRadius: 3,
                                    offset: Offset(1, 1)),
                              ]),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              AppText(
                                'Cá basa',
                                color: Colors.black.withOpacity(0.75),
                              ),
                              AppText(
                                '(#0$index)',
                                fontSize: 13,
                                color: Colors.black54,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Row(
                      children: [
                        AppText('Quản lý thiết bị'),
                        Spacer(),
                        AppText(
                          'Xem tất cả',
                          color: Colors.white70,
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        ),
                        Icon(
                          Icons.arrow_right,
                          color: Colors.white70,
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: List.generate(
                        6,
                        (index) => Container(
                          height: 110,
                          width: 110,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 206, 227, 230),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                width: 1.5,
                                color: Colors.cyanAccent,
                              ),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.white12,
                                    blurRadius: 3,
                                    offset: Offset(1, 1)),
                              ]),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              AppText(
                                'Sensor\nnhiệt độ',
                                fontSize: 14.5,
                                color: Colors.black.withOpacity(0.75),
                              ),
                              AppText(
                                '(#0$index)',
                                fontSize: 13,
                                color: Colors.black54,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const BottomBarWidget(selected: 3),
        ],
      ),
    );
  }
}

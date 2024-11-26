import 'dart:ui';

import 'package:aquaculture_pond_monitoring/presentation/home/home.dart';
import 'package:aquaculture_pond_monitoring/presentation/profile/profile_view.dart';
import 'package:aquaculture_pond_monitoring/presentation/report/report_view.dart';
import 'package:aquaculture_pond_monitoring/presentation/widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

class BottomBarWidget extends StatelessWidget {
  final int selected;

  const BottomBarWidget({super.key, required this.selected});

  @override
  Widget build(BuildContext context) {
    Widget itemBuilder(
        String text, IconData icon, bool selected, void Function() onTap) {
      return GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: selected ? null : Colors.white.withOpacity(0.5),
            gradient: selected
                ? const LinearGradient(
                    colors: [Colors.cyanAccent, Colors.blueAccent])
                : null,
            borderRadius: BorderRadius.circular(8),
          ),
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 18,
                color: selected ? Colors.white : Colors.black.withOpacity(0.8),
              ),
              const SizedBox(width: 4),
              AppText(
                text,
                fontWeight: FontWeight.w500,
                fontSize: 15,
                color: selected ? null : Colors.black.withOpacity(0.8),
              ),
            ],
          ),
        ),
      );
    }

    return Container(
      alignment: Alignment.bottomCenter,
      margin: const EdgeInsets.only(bottom: 16),
      child: Container(
        height: 50,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white24,
          borderRadius: BorderRadius.circular(8),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
            child: Row(
              children: [
                const SizedBox(width: 4),
                Expanded(
                    child: itemBuilder(
                  'Theo dõi',
                  PhosphorIcons.barcode_bold,
                  selected == 1,
                  () {
                    Navigator.of(context).push(NoAnimationMaterialPageRoute(
                        builder: (context) => const HomeView()));
                  },
                )),
                const SizedBox(width: 4),
                Expanded(
                    child: itemBuilder(
                  'Cảnh báo',
                  PhosphorIcons.tag_bold,
                  selected == 2,
                  () {
                    Navigator.of(context).push(NoAnimationMaterialPageRoute(
                        builder: (context) => const ReportView()));
                  },
                )),
                const SizedBox(width: 4),
                Expanded(
                    child: itemBuilder(
                  'Quản lý',
                  PhosphorIcons.squares_four_bold,
                  selected == 3,
                  () {
                    Navigator.of(context).push(NoAnimationMaterialPageRoute(
                        builder: (context) => const ProfileView()));
                  },
                )),
                const SizedBox(width: 4),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NoAnimationMaterialPageRoute<T> extends MaterialPageRoute<T> {
  NoAnimationMaterialPageRoute({
    required super.builder,
    super.settings,
    super.maintainState,
    super.fullscreenDialog,
  });

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return child;
  }
}

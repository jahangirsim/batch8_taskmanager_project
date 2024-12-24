import 'package:batch8_taskmanager_project/ui/utils/assets_patch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ScreenBackground extends StatelessWidget {
  const ScreenBackground({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(
          AssetsPath.backgroundSVG,
          fit: BoxFit.cover,
          height: double.maxFinite,
          width: double.maxFinite,
        ),
        SafeArea(child: child),
      ],
    );
  }
}

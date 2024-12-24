import 'package:batch8_taskmanager_project/ui/utils/assets_patch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      AssetsPath.logoSVG,
      width: 120,
    );
  }
}
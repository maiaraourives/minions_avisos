import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CsIcon extends StatelessWidget {
  ///[Icon] personalizado utilizado no aplicativo
  const CsIcon.icon({
    required this.icon,
    this.size = 24,
    this.color,
    super.key,
  }) : svgPath = null;

  ///[SvgPicture.asset] personalizado utilizado no aplicativo
  const CsIcon.svg({
    required this.svgPath,
    this.size = 30,
    this.color,
    super.key,
  }) : icon = null;

  final String? svgPath;
  final IconData? icon;
  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (svgPath != null) {
      return SvgPicture.asset(
        svgPath!,
        width: size,
        height: size,
        colorFilter: ColorFilter.mode(color ?? theme.indicatorColor, BlendMode.srcIn),
      );
    }

    return Icon(
      icon,
      size: size,
      color: color ?? theme.indicatorColor,
    );
  }
}

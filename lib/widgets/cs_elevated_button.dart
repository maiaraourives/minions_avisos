import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CsElevatedButton extends StatelessWidget {
  const CsElevatedButton({
    required this.onPressed,
    required this.label,
    this.icon,
    this.height = 45,
    this.width = double.infinity,
    this.backgroundColor,
    this.colorText,
    super.key,
  });

  final VoidCallback? onPressed;
  final String label;
  final Widget? icon;
  final double height;
  final double width;
  final Color? backgroundColor;
  final Color? colorText;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: icon ?? Container(),
        clipBehavior: Clip.none,
        label: AutoSizeText(label, style: TextStyle(color: colorText ?? Colors.white)),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (backgroundColor != null) {
              return backgroundColor;
            }

            return theme.primaryColor;
          }),
          textStyle: MaterialStateProperty.all(theme.textTheme.labelLarge),
          elevation: MaterialStateProperty.all(5),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
    );
  }
}

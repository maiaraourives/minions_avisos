import 'package:flutter/material.dart';

class CsTextButton extends StatelessWidget {
  ///Cria um Text Button totalmente customizado para ser utilizado no aplicativo
  const CsTextButton({
    required this.label,
    required this.onPressed,
    this.alignment,
    this.color,
    this.splashColor,
    this.padding,
    Key? key,
  }) : super(key: key);

  final String label;
  final void Function()? onPressed;
  final AlignmentGeometry? alignment;
  final Color? color;
  final Color? splashColor;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(5),
      splashColor: splashColor ?? theme.colorScheme.onPrimary,
      focusColor: splashColor ?? theme.colorScheme.onPrimary,
      hoverColor: splashColor ?? theme.colorScheme.onPrimary,
      highlightColor: splashColor ?? theme.colorScheme.onPrimary,
      child: Container(
        padding: padding ?? const EdgeInsets.all(10),
        alignment: alignment,
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
            fontSize: 15,
            color: color ?? theme.colorScheme.primaryContainer,
          ),
        ),
      ),
    );
  }
}

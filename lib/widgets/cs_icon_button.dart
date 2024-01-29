import 'package:flutter/material.dart';

class CsIconButton extends StatelessWidget {
  const CsIconButton.light({
    required this.icon,
    this.onPressed,
    this.tooltip,
    this.size,
    this.light = true,
    super.key,
  });

  const CsIconButton.dark({
    required this.icon,
    this.onPressed,
    this.tooltip,
    this.size,
    this.light = false,
    super.key,
  });

  final VoidCallback? onPressed;
  final Widget icon;
  final String? tooltip;
  final double? size;
  final bool light;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return IconButton(
      onPressed: onPressed,
      splashColor: light ? theme.colorScheme.onPrimary : null,
      focusColor: light ? theme.colorScheme.onPrimary : null,
      hoverColor: light ? theme.colorScheme.onPrimary : null,
      highlightColor: light ? theme.colorScheme.onPrimary : null,
      icon: icon,
      iconSize: size,
      tooltip: tooltip,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(0),
      visualDensity: VisualDensity.comfortable,
    );
  }
}

import 'package:flutter/material.dart';

class CsFloatingActionButton extends StatelessWidget {
  const CsFloatingActionButton({
    required this.onPressed,
    this.child,
    this.tooltip,
    this.heroTag,
    this.margin,
    this.mini = false,
    this.backgroundColor,
    super.key,
  });

  final void Function()? onPressed;
  final Widget? child;
  final String? tooltip;
  final Object? heroTag;
  final EdgeInsets? margin;
  final bool mini;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: margin ?? const EdgeInsets.all(15),
      child: FloatingActionButton(
        mini: mini,
        heroTag: heroTag,
        tooltip: tooltip,
        onPressed: onPressed,
        elevation: 3,
        backgroundColor: backgroundColor ?? theme.primaryColor,
        splashColor: backgroundColor?.withOpacity(0.8) ?? theme.colorScheme.secondary,
        hoverColor: backgroundColor?.withOpacity(0.8) ?? theme.colorScheme.secondary,
        child: child,
      ),
    );
  }
}

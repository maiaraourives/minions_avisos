import 'package:flutter/material.dart';

class CsThemeDatePicker extends StatelessWidget {
  /// Utilizado para mudar o layout default do [DatePicker]
  const CsThemeDatePicker({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Theme(
      data: theme.copyWith(
        primaryColor: theme.primaryColor,
        colorScheme: ColorScheme.light(
          // Header background color
          primary: theme.primaryColor,
          // Header text color
          onPrimary: theme.colorScheme.onSecondary,
          // Body text color
          onSurface: theme.colorScheme.primaryContainer,
        ),

        // Button text theme
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: theme.colorScheme.primaryContainer,
          ),
        ),

        // Card border theme
        dialogTheme: DialogTheme(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      child: child,
    );
  }
}

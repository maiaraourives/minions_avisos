import 'dart:ui';

import 'package:flutter/material.dart';

import '/../extensions/context_ext.dart';

class CsAlertDialogContent extends StatelessWidget {
  ///Widget utilizado para exibir um [AlertDialog] com o seu conteúdo totalmente personalizado
  const CsAlertDialogContent({
    required this.content,
    this.title,
    this.backgroundColor,
    super.key,
  });

  final Widget content;
  final String? title;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: AlertDialog(
        clipBehavior: Clip.none,
        // Dados obrigatórios
        content: SizedBox(
          width: double.maxFinite,
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              content,
              if (title != null) ...[
                Positioned(
                  top: -45,
                  child: Container(
                    height: 60,
                    width: context.width * 0.81,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: theme.indicatorColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                    ),
                    child: Text(
                      title!,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: theme.iconTheme.color, fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),

        // Default
        backgroundColor: backgroundColor ?? theme.scaffoldBackgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: backgroundColor == null ? 5 : 0,
        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      ),
    );
  }
}

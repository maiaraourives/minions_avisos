import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../cs_icon.dart';

class CardErrorLogin extends StatelessWidget {
  const CardErrorLogin({
    required this.message,
    super.key,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      elevation: 0,
      margin: const EdgeInsets.all(0),
      color: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(
          color: theme.colorScheme.onPrimaryContainer,
          width: 2,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Row(
          children: [
            const CsIcon.icon(
              icon: Icons.warning_amber_rounded,
              color: Colors.red,
              size: 28,
            ),
            const SizedBox(width: 15),
            Flexible(
              child: AutoSizeText(
                message,
                maxLines: 2,
                style: TextStyle(
                  color: theme.primaryColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

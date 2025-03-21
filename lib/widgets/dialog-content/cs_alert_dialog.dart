import 'dart:ui';

import 'package:flutter/material.dart';

import 'cs_header_content.dart';

class CsAlertDialog extends StatelessWidget {
  const CsAlertDialog({
    required this.title,
    required this.description,
    this.actions,
    super.key,
  });

  final String title;
  final String description;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
      child: AlertDialog(
        content: SizedBox(
          width: double.maxFinite,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CsHeaderContent(label: title, useMargin: false),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      description,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        actions: actions,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 5,
        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      ),
    );
  }
}

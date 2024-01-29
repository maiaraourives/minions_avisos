import 'package:flutter/material.dart';

class CsHeaderContent extends StatelessWidget {
  const CsHeaderContent({
    required this.label,
    this.useMargin = true,
    super.key,
  });

  final String label;
  final bool useMargin;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (useMargin) ...[
            const SizedBox(height: 0),
          ],
          Text(
            label,
            style: TextStyle(
              color: theme.primaryColor,
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 5),
          Divider(
            color: theme.primaryColor,
            thickness: 1,
          ),
        ],
      ),
    );
  }
}

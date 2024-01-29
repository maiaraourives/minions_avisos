import 'package:flutter/material.dart';

import '../../models/minions/minions_model.dart';

class CardMinions extends StatelessWidget {
  const CardMinions({
    required this.minions,
    required this.select,
    super.key,
  });

  final MinionsModel minions;
  final void Function(MinionsModel minions) select;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      color: theme.scaffoldBackgroundColor,
      elevation: 5,
      margin: const EdgeInsets.symmetric(horizontal: 10).copyWith(top: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15), side: BorderSide(color: theme.primaryColor, width: 3)),
      child: InkWell(
        onTap: () => select(minions),
        splashColor: theme.colorScheme.onPrimary,
        focusColor: theme.colorScheme.onPrimary,
        hoverColor: theme.colorScheme.onPrimary,
        highlightColor: theme.colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              minions.foto,
              width: 100,
              height: 100,
            ),
            const SizedBox(height: 10),
            Text(
              minions.nome,
              style: TextStyle(
                color: theme.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CsCircularProgressIndicador extends StatelessWidget {
  const CsCircularProgressIndicador.light({
    this.height = 45,
    this.withMessage = false,
    this.message,
    super.key,
  }) : color = Colors.white;

  const CsCircularProgressIndicador.dark({
    this.height = 35,
    this.withMessage = false,
    this.message,
    super.key,
  }) : color = null;

  final double height;
  final Color? color;
  final bool withMessage;
  final String? message;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            LoadingAnimationWidget.hexagonDots(
              color: color ?? theme.primaryColor,
              size: 35,
            ),
            if (withMessage) ...[
              const SizedBox(height: 20),
              Text(
                message ?? 'Carregando Dados',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: color ?? theme.colorScheme.primaryContainer,
                  fontSize: 16,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

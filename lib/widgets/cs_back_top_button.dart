import 'package:flutter/material.dart';

import 'cs_floating_action_button.dart';

class CsBackTopButton extends StatefulWidget {
  const CsBackTopButton({
    required this.scrollController,
    this.child,
    super.key,
  });

  final ScrollController scrollController;
  final Widget? child;

  @override
  State<CsBackTopButton> createState() => _CsBackTopButtonState();
}

class _CsBackTopButtonState extends State<CsBackTopButton> with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  bool visible = false;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      reverseDuration: const Duration(milliseconds: 500),
      vsync: this,
    );

    animation = CurvedAnimation(
      curve: Curves.easeInToLinear,
      reverseCurve: Curves.easeInToLinear,
      parent: controller,
    );

    widget.scrollController.addListener(_listener);
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_listener);

    controller.dispose();

    super.dispose();
  }

  void _listener() {
    try {
      if ((widget.scrollController.position.pixels).abs() > 150) {
        controller.forward();

        setState(() {
          visible = true;
        });
      }
      if (widget.scrollController.position.pixels < 20) {
        controller.reverse();

        Future.delayed(const Duration(milliseconds: 500), () {
          visible = false;
          setState(() {});
        });
      }
    } catch (_) {}
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: ScaleTransition(
        scale: animation,
        child: CsFloatingActionButton(
          heroTag: animation,
          tooltip: 'Voltar ao topo',
          onPressed: () {
            widget.scrollController.animateTo(
              0,
              duration: const Duration(seconds: 1, milliseconds: 500),
              curve: Curves.linear,
            );
          },
          child: widget.child,
        ),
      ),
    );
  }
}

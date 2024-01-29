import 'package:flutter/material.dart';

class CsCheckboxListTile extends StatelessWidget {
  ///Cria um [CustomCheckboxListTile] para ser utilizado como campos dos cadastros no aplicativo
  const CsCheckboxListTile({
    required this.onChanged,
    required this.value,
    this.title,
    this.height = 50,
    super.key,
  });

  final void Function(bool?)? onChanged;
  final bool? value;
  final String? title;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      height: height,
      child: InkWell(
        onTap: () => onChanged!(!value!),
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        child: Row(
          children: [
            Theme(
              data: ThemeData(
                unselectedWidgetColor: theme.primaryColor,
              ),
              child: Checkbox(
                value: value,
                onChanged: onChanged,
                side: BorderSide(color: theme.primaryColor),
                activeColor: theme.primaryColor,
                checkColor: theme.colorScheme.onPrimaryContainer,
                hoverColor: Colors.red,
              ),
            ),
            Expanded(
              child: Text(
                title!,
                style: TextStyle(
                  color: theme.primaryColor,
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

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CsTextFormField extends StatelessWidget {
  ///[TextFormField] utilizados no aplicativo
  const CsTextFormField({
    required this.hintText,
    this.onChanged,
    this.validator,
    this.controller,
    this.enabled = true,
    this.forceDisable = false,
    this.autocorrect = true,
    this.autofocus = false,
    this.enableSuggestions = true,
    this.obscureText = false,
    this.inputFormatters,
    this.keyboardType,
    this.focus,
    this.textCapitalization = TextCapitalization.none,
    this.textInputAction,
    this.maxLength,
    this.maxLines = 1,
    this.label,
    this.obrigatorio = false,
    this.prefixIcon,
    this.suffixIcon,
    this.errorText,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.filled = false,
    this.onTap,
    this.onSaved,
    super.key,
  });

  ///[TextFormField] secondary utilizados no aplicativo
  const CsTextFormField.secondary({
    required this.hintText,
    this.onChanged,
    this.validator,
    this.controller,
    this.enabled = true,
    this.forceDisable = false,
    this.autocorrect = true,
    this.autofocus = false,
    this.enableSuggestions = true,
    this.obscureText = false,
    this.inputFormatters,
    this.keyboardType,
    this.focus,
    this.textCapitalization = TextCapitalization.none,
    this.textInputAction,
    this.maxLength,
    this.maxLines = 1,
    this.label,
    this.obrigatorio = false,
    this.prefixIcon,
    this.suffixIcon,
    this.errorText,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.filled = true,
    this.onTap,
    this.onSaved,
    super.key,
  });

  final String hintText;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;

  final TextEditingController? controller;
  final bool enabled;
  final bool forceDisable;
  final bool autocorrect;
  final bool autofocus;
  final bool enableSuggestions;
  final bool obscureText;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final FocusNode? focus;
  final TextCapitalization textCapitalization;
  final TextInputAction? textInputAction;
  final int? maxLength;
  final int? maxLines;
  final String? label;
  final bool obrigatorio;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? errorText;
  final AutovalidateMode autovalidateMode;
  final bool filled;
  final VoidCallback? onTap;
  final void Function(String?)? onSaved;

  EdgeInsets _definePadding() {
    const double defaultPadding = 20;
    const double padding = 50;

    if (suffixIcon != null && prefixIcon != null) {
      return const EdgeInsets.symmetric(
        horizontal: padding,
        vertical: defaultPadding,
      );
    }

    if (suffixIcon != null) {
      return const EdgeInsets.all(defaultPadding).copyWith(right: padding);
    }

    if (prefixIcon != null) {
      return const EdgeInsets.all(defaultPadding).copyWith(left: padding);
    }

    return const EdgeInsets.all(defaultPadding);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final textFieldSecondaryBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: theme.primaryColor,
        width: 1,
      ),
      gapPadding: 4,
    );

    final textFieldBorder = UnderlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: theme.primaryColor,
        width: 2,
      ),
    );


    final textFieldBorderError = UnderlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: Colors.red,
        width: 2,
      ),
    );

    return InkWell(
      onTap: onTap,
      splashColor: Colors.grey[100],
      hoverColor: Colors.grey[50],
      focusColor: Colors.grey[50],
      highlightColor: Colors.grey[50],
      child: Stack(
        children: [
          //Utilizado apenas para validação de campos desabilitados
          IgnorePointer(
            ignoring: true,
            child: TextFormField(
              enabled: forceDisable ? false : !enabled,
              validator: (_) => validator != null ? validator!(controller?.text ?? '') : null,
              maxLength: maxLength,
              maxLines: maxLines,
              autovalidateMode: autovalidateMode,
              decoration: InputDecoration(
                isDense: true,
                counterText: '',
                errorStyle: const TextStyle(fontSize: 0),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                contentPadding: _definePadding(),
              ),
            ),
          ),

          TextFormField(
            //Campos obrigatórios
            onChanged: onChanged,
            validator: validator,
            controller: controller,

            //Campos opcionais
            onSaved: onSaved,
            enabled: enabled,
            autocorrect: autocorrect,
            autofocus: autofocus,
            enableSuggestions: enableSuggestions,
            obscureText: obscureText,
            inputFormatters: inputFormatters,
            keyboardType: keyboardType,
            focusNode: focus,
            textCapitalization: textCapitalization,
            maxLength: maxLength,
            maxLines: maxLines,
            scrollPhysics: const BouncingScrollPhysics(),
            textInputAction: textInputAction,
            autovalidateMode: autovalidateMode,
            decoration: InputDecoration(
              filled: filled,
              counterText: '',
              fillColor: Colors.transparent,
              alignLabelWithHint: true,
              floatingLabelBehavior: filled ? FloatingLabelBehavior.always : FloatingLabelBehavior.never,
              label: _Label(
                label: label ?? '',
                obrigatorio: obrigatorio,
                filled: filled,
              ),
              hintText: hintText,
              errorText: errorText,
              hintStyle: filled ? TextStyle(color: theme.primaryColor.withOpacity(0.5)) : TextStyle(color: theme.primaryColor),
              errorStyle: filled ? theme.inputDecorationTheme.errorStyle : const TextStyle(color: Colors.red),
              border: filled ? textFieldSecondaryBorder : textFieldBorder,
              enabledBorder: filled ? textFieldSecondaryBorder : textFieldBorder,
              errorBorder: filled ? textFieldSecondaryBorder : textFieldBorderError,
              focusedErrorBorder: filled ? textFieldSecondaryBorder : textFieldBorder,
              focusedBorder: filled ? textFieldSecondaryBorder : textFieldBorder,
              disabledBorder: filled ? textFieldSecondaryBorder : textFieldBorder,
              contentPadding: _definePadding(),
              enabled: enabled,
            ),
            style: filled ? TextStyle(color: theme.primaryColor.withOpacity(0.5)): TextStyle(color: theme.primaryColor),
          ),

          ///Define a posição do ícone que será exibida no [TextField], se possuir
          if (prefixIcon != null) ...[
            Positioned(
              top: filled ? 10 : 18,
              left: filled ? 5 : 0,
              bottom: 0,
              child: Align(
                alignment: Alignment.topLeft,
                child: ExcludeSemantics(
                  child: prefixIcon!,
                ),
              ),
            ),
          ],

          ///Define a posição do ícone que será exibida no [TextField], se possuir
          if (suffixIcon != null) ...[
            Positioned(
              top: filled ? 10 : 18,
              right: filled ? 5 : 0,
              bottom: 0,
              child: Align(
                alignment: Alignment.topRight,
                child: suffixIcon!,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _Label extends StatelessWidget {
  const _Label({
    required this.label,
    required this.obrigatorio,
    required this.filled,
  });

  final String label;
  final bool obrigatorio;
  final bool filled;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: label,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: filled ? theme.primaryColor : theme.primaryColor,
              fontSize: 18,
            ),
          ),
          if (obrigatorio) ...[
            const TextSpan(
              text: ' *',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                color: Colors.red,
                fontSize: 16,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

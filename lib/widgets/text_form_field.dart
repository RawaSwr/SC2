import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simple_note_taking_app/core/theme/theme.dart';
import 'package:simple_note_taking_app/widgets/text_widget.dart';

// ignore: must_be_immutable
class AppTextFormField extends StatelessWidget {
  final String label;
  final String hint;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final AutovalidateMode? autovalidateMode;
  final bool obscureText;
  final TextInputType? keyboardType;
  final int? maxLines;
  final int? maxLength;
  final bool? isRequired;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final void Function(String)? onFieldSubmitted;
  final Function()? onTap;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? contentPadding;
  final String? tooltip;
  final bool? enabled;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final Iterable<String>? autofillHints;
  final TextStyle? hintStyle;
  final String? initialValue;
  AppTextFormField({
    Key? key,
    required this.label,
    this.validator,
    this.controller,
    this.obscureText = false,
    this.keyboardType,
    this.suffixIcon,
    this.prefixIcon,
    required this.hint,
    this.padding,
    this.maxLines,
    this.maxLength,
    this.tooltip,
    this.enabled,
    this.onTap,
    this.isRequired,
    this.inputFormatters,
    this.onChanged,
    this.onSaved,
    this.onFieldSubmitted,
    this.textInputAction,
    this.focusNode,
    this.autovalidateMode,
    this.contentPadding,
    this.autofillHints,
    this.hintStyle,
    this.initialValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) => Container(
        padding: padding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
              child: TextWidget(
                  label,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
            ),
            TextFormField(
              focusNode: focusNode,
              maxLength: maxLength,
              autovalidateMode: isRequired == true
                  ? AutovalidateMode.always
                  : autovalidateMode,
              controller: controller,
              validator: validator,
              autofillHints: autofillHints,
              maxLines: obscureText ? 1 : maxLines,
              keyboardType: keyboardType,
              enabled: enabled,
              readOnly: enabled != null && enabled!,
              onChanged: onChanged,
              onSaved: onSaved,
              initialValue: initialValue,
              onFieldSubmitted: onFieldSubmitted,
              onTap: onTap,
              inputFormatters: inputFormatters,
              textInputAction: textInputAction,
              textAlignVertical:
                  contentPadding != null ? TextAlignVertical.top : null,
              decoration: InputDecoration(
                hintText: hint,
                suffixIcon: suffixIcon,
                prefixIcon: prefixIcon,
                contentPadding: contentPadding,
                isDense: true,
                enabled: true,
                fillColor: kcWhite,
                focusColor: kcLightBlack,
                hoverColor: kcLightBlack.withOpacity(0.1),
                filled: true,
                hintStyle: hintStyle ??
                    textStyle(
                      color: kcBlack,
                      fontSize: 14,
                      fontWeight: FontWeight.w200,
                    ),
                errorStyle: textStyle(
                  color: kcRed,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: kcLightBlack),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: kcLightBlack),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: kcRed),
                ),
                disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: kcLightBlack)),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: kcRed),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final dynamic prefixIcon;
  final double? prefixIconSize;
  final void Function(String text)? onFieldSubmitted;
  final void Function(String text)? onChanged;
  final TextInputType? keyboardType;
  final int? maxLength;
  final FocusNode? focusNode;
  final String? Function(String? value)? validator;
  final String? hintText;
  final String? suffixText;
  final Widget? prefixWidget;
  final List<TextInputFormatter>? inputFormatters;
  final bool enabled;
  const AppTextField({
    super.key,
    this.controller,
    this.label,
    this.prefixIcon,
    this.prefixIconSize,
    this.onFieldSubmitted,
    this.onChanged,
    this.keyboardType,
    this.maxLength,
    this.focusNode,
    this.validator,
    this.hintText,
    this.suffixText,
    this.prefixWidget,
    this.inputFormatters,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        label != null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6.0),
                    child: Text(
                      label!,
                      style: theme.textTheme.bodySmall!.apply(
                        color: theme.colorScheme.tertiary,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                ],
              )
            : const SizedBox(),
        TextFormField(
          key: key,
          controller: controller,
          focusNode: focusNode,
          cursorColor: theme.colorScheme.onBackground.withOpacity(0.5),
          cursorWidth: 1.5,
          obscureText: keyboardType == TextInputType.visiblePassword,
          onFieldSubmitted: onFieldSubmitted,
          onChanged: onChanged,
          keyboardType: keyboardType,
          maxLength: maxLength,
          validator: validator,
          enabled: enabled,
          inputFormatters: inputFormatters,
          maxLines: keyboardType == TextInputType.multiline ? 4 : 1,
          style: GoogleFonts.poppins().copyWith(
            color: const Color(0xff1b1b1f),
            fontSize: 14,
          ),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: GoogleFonts.poppins().copyWith(
              color: const Color(0xff757680),
              fontSize: 14,
            ),
            contentPadding: const EdgeInsets.all(12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: theme.colorScheme.error.withOpacity(0.6),
                width: 1.0,
              ),
            ),
            errorStyle: GoogleFonts.poppins().apply(
              color: theme.colorScheme.error.withOpacity(0.5),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xff2563EB), width: 1),
            ),
            suffixText: suffixText,
            suffixStyle: GoogleFonts.poppins().apply(
              color: theme.colorScheme.onBackground.withOpacity(0.1),
            ),
            prefixIcon: prefixWidget ??
                (prefixIcon != null
                    ? Icon(
                        prefixIcon,
                        color: theme.colorScheme.onBackground.withOpacity(0.3),
                        size: prefixIconSize ?? 24,
                      )
                    : null),
            focusColor: Colors.white,
            filled: true,
            fillColor: const Color(0xffF3F4F6),
          ),
        ),
      ],
    );
  }
}

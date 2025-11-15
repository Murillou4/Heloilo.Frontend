import 'package:flutter/material.dart';
import 'package:heloilo/core/themes/app_colors.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final String? hintText;
  final IconData? prefixIcon;
  final bool isPassword;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final void Function(String)? onChanged;
  final int? maxLines;
  final bool? readOnly;
  final VoidCallback? onTap;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.labelText,
    this.hintText,
    this.prefixIcon,
    this.isPassword = false,
    this.validator,
    this.keyboardType,
    this.textInputAction,
    this.onChanged,
    this.maxLines = 1,
    this.readOnly = false,
    this.onTap,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  // Estado interno para gerenciar a visibilidade da senha
  bool _isObscured = false;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    // Define o estado inicial baseado na propriedade isPassword
    _isObscured = widget.isPassword;
  }

  // Obtém as cores apropriadas baseado no tema atual
  Color _getPrimaryColor(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return brightness == Brightness.light
        ? AppColors.primaryLight
        : AppColors.primaryDark;
  }

  Color _getFillColor(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    if (_isFocused) {
      return brightness == Brightness.light
          ? AppColors.surfaceLight
          : AppColors.surfaceDark;
    }
    return brightness == Brightness.light
        ? AppColors.surfaceElevatedLight
        : AppColors.surfaceElevatedDark;
  }

  Color _getBorderColor(BuildContext context, bool hasError) {
    if (hasError) {
      return AppColors.error;
    }
    if (_isFocused) {
      return _getPrimaryColor(context);
    }
    final brightness = Theme.of(context).brightness;
    return brightness == Brightness.light
        ? AppColors.borderLight
        : AppColors.borderDark;
  }

  Color _getIconColor(BuildContext context) {
    if (_isFocused) {
      return _getPrimaryColor(context);
    }
    final brightness = Theme.of(context).brightness;
    return brightness == Brightness.light
        ? AppColors.textSecondaryLight
        : AppColors.textSecondaryDark;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final brightness = theme.brightness;
    final primaryColor = _getPrimaryColor(context);
    final hasError =
        widget.validator != null &&
        widget.controller.text.isNotEmpty &&
        widget.validator!(widget.controller.text) != null;

    return Focus(
      onFocusChange: (hasFocus) {
        setState(() {
          _isFocused = hasFocus;
        });
      },
      child: TextFormField(
        controller: widget.controller,
        validator: widget.validator,
        keyboardType: widget.keyboardType,
        textInputAction: widget.textInputAction,
        onChanged: (value) {
          widget.onChanged?.call(value);
          if (widget.validator != null) {
            setState(() {}); // Atualiza para mostrar erros em tempo real
          }
        },
        obscureText: _isObscured,
        maxLines: widget.maxLines,
        readOnly: widget.readOnly ?? false,
        onTap: widget.onTap,
        style: TextStyle(
          color: brightness == Brightness.light
              ? AppColors.textPrimaryLight
              : AppColors.textPrimaryDark,
          fontSize: 16,
        ),
        decoration: InputDecoration(
          labelText: widget.labelText,
          hintText: widget.hintText,
          filled: true,
          fillColor: _getFillColor(context),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 18,
          ),
          prefixIcon: widget.prefixIcon != null
              ? Icon(widget.prefixIcon, color: _getIconColor(context), size: 22)
              : null,
          prefixIconConstraints: const BoxConstraints(
            minWidth: 48,
            minHeight: 48,
          ),
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(
                    _isObscured
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: _getIconColor(context),
                    size: 22,
                  ),
                  onPressed: () {
                    setState(() {
                      _isObscured = !_isObscured;
                    });
                  },
                )
              : null,
          suffixIconConstraints: const BoxConstraints(
            minWidth: 48,
            minHeight: 48,
          ),
          labelStyle: TextStyle(
            color: hasError
                ? AppColors.error
                : _isFocused
                ? primaryColor
                : (brightness == Brightness.light
                      ? AppColors.textSecondaryLight
                      : AppColors.textSecondaryDark),
            fontSize: _isFocused ? 14 : 16,
          ),
          hintStyle: TextStyle(
            color: brightness == Brightness.light
                ? AppColors.textHintLight
                : AppColors.textHintDark,
            fontSize: 16,
          ),
          errorStyle: TextStyle(
            color: AppColors.error,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(
              color: _getBorderColor(context, hasError),
              width: 1.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(
              color: _getBorderColor(context, hasError),
              width: 2.0,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(color: AppColors.error, width: 1.5),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(color: AppColors.error, width: 2.0),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(
              color: brightness == Brightness.light
                  ? AppColors.borderLight
                  : AppColors.borderDark,
              width: 1.5,
            ),
          ),
        ),
      ),
    );
  }
}

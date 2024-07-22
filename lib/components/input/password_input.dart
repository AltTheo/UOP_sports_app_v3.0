import 'package:flutter/material.dart';

class PasswordInput extends StatelessWidget {
  const PasswordInput(
      {super.key,
      required this.controller,
      required this.autofocus,
      this.onFieldSubmitted,
      this.onChanged,
      this.labelText,
      this.errorText,
      this.suffixIcon,
      required this.obscureText,
      required this.keyboardType,
      required this.action});

  final TextEditingController controller;
  final bool autofocus;
  final Function(String)? onFieldSubmitted;
  final Function(String)? onChanged;
  final String? labelText;
  final String? errorText;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextInputType keyboardType;
  final TextInputAction action;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: action,
      keyboardType: keyboardType,
      controller: controller,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      autofocus: autofocus,
      obscureText: obscureText,
      decoration: InputDecoration(
          suffixIcon: suffixIcon,
          contentPadding: const EdgeInsets.only(left: 30, top: 45),
          labelText: labelText,
          labelStyle: Theme.of(context).textTheme.bodyLarge,
          errorText: errorText,
          errorStyle: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: Colors.red),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide:
                  BorderSide(color: Theme.of(context).colorScheme.error)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
    );
  }
}

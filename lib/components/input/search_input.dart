import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchInput extends StatelessWidget {
  const SearchInput(
      {super.key,
      required this.controller,
      required this.autofocus,
      this.onFieldSubmitted,
      this.onChanged,
      this.labelText,
      this.errorText,
      required this.keyboardType,
      required this.action,
      this.hintText});

  final TextEditingController controller;
  final bool autofocus;
  final Function(String)? onFieldSubmitted;
  final Function(String)? onChanged;
  final String? labelText;
  final String? hintText;
  final String? errorText;
  final TextInputType keyboardType;
  final TextInputAction action;
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenHeight = screenSize.height;
    var screenWidth = screenSize.width;
    return Padding(
      padding: EdgeInsets.only(
          left: screenWidth * 0.06,
          right: screenWidth * 0.06,
          top: screenHeight * 0.02),
      child: TextFormField(
        style: Theme.of(context).textTheme.bodyLarge,
        textInputAction: action,
        keyboardType: keyboardType,
        controller: controller,
        onFieldSubmitted: onFieldSubmitted,
        onChanged: onChanged,
        autofocus: autofocus,
        decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            labelText: labelText,
            hintText: hintText,
            hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context)
                      .colorScheme
                      .onSurface
                      .withValues(alpha: 0.5),
                ),
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
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            suffix: const Icon(
              CupertinoIcons.search,
              size: 25,
            )),
      ),
    );
  }
}

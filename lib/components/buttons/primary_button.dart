import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {super.key,
      this.onPressed,
      required this.buttonText,
      required this.isEnabled});
  final void Function()? onPressed;
  final String buttonText;
  final bool isEnabled;
  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;
    var screenWidth = screensize.width;
    var screenHeight = screensize.height;
    return Padding(
      padding:
          EdgeInsets.only(left: screenWidth * 0.05, right: screenWidth * 0.05),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              fixedSize: Size(screenWidth * 0.95, screenHeight * 0.075),
              backgroundColor: isEnabled
                  ? Theme.of(context).colorScheme.primary
                  : Colors.grey),
          onPressed: onPressed,
          child: Text(buttonText,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.white, fontWeight: FontWeight.w700))),
    );
  }
}

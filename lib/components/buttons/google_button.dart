import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uop_sports_v3/common/app_features/icons.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({super.key, this.onPressed, required this.buttonText});
  final void Function()? onPressed;
  final String buttonText;

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
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            fixedSize: Size(screenWidth * 0.95, screenHeight * 0.075),
          ),
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(UAppIcons.googleIcon),
              SizedBox(
                width: screenWidth * 0.05,
              ),
              Text(buttonText,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(fontWeight: FontWeight.w600)),
            ],
          )),
    );
  }
}

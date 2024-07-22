import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uop_sports_v3/auth/sign_in.dart';
import 'package:uop_sports_v3/auth/sign_up.dart';
import 'package:uop_sports_v3/common/app_features/app_logo.dart';
import 'package:uop_sports_v3/components/buttons/primary_button.dart';
import 'package:uop_sports_v3/navigation/global_key.dart';

class UopWelcome extends StatelessWidget {
  const UopWelcome({super.key});

  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;
    var screenWidth = screensize.width;
    var screenHeight = screensize.height;
    return PopScope(
      canPop: false,
      child: Scaffold(
          body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              UopAppLogo.uopLogo,
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: screenHeight * 0.05 /*  */,
                  left: screenWidth * 0.06,
                  right: screenWidth * 0.06),
              child: Text(
                textAlign: TextAlign.center,
                'UoP Sports',
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: screenHeight * 0.045),
              child: PrimaryButton(
                buttonText: 'Get started',
                onPressed: () {
                  navigatorKey.currentState?.push(MaterialPageRoute(
                      builder: (context) => const SignInPage()));
                },
                isEnabled: true,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: screenHeight * 0.035),
              child: PrimaryButton(
                buttonText: 'Create an account',
                onPressed: () {
                  navigatorKey.currentState?.push(MaterialPageRoute(
                      builder: (context) => const SignUpPage()));
                },
                isEnabled: true,
              ),
            ),
          ],
        ),
      )),
    );
  }
}

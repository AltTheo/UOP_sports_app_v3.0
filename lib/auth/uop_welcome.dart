import 'package:flutter/material.dart';
import 'package:uop_sports_v3/auth/sign_in.dart';
import 'package:uop_sports_v3/auth/sign_up.dart';
import 'package:uop_sports_v3/common/app_features/app_logo.dart';
import 'package:uop_sports_v3/components/buttons/primary_button.dart';
import 'package:uop_sports_v3/components/wrappers/default_wrapper.dart';
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
      child: DefaultWrapper(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              UopAppLogo.uopLogo,
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: screenWidth * 0.06, right: screenWidth * 0.06),
              child: Text(
                textAlign: TextAlign.center,
                'UOP',
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w800),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: screenWidth * 0.06, right: screenWidth * 0.06),
              child: Text(
                textAlign: TextAlign.center,
                'SPORTS',
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w800),
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

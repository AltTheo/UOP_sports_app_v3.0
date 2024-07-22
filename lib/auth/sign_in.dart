import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uop_sports_v3/common/widgets/or_divider.dart';
import 'package:uop_sports_v3/components/buttons/google_button.dart';
import 'package:uop_sports_v3/components/buttons/primary_button.dart';
import 'package:uop_sports_v3/components/input/password_input.dart';
import 'package:uop_sports_v3/components/input/text_input.dart';
import 'package:uop_sports_v3/navigation/global_key.dart';
import 'package:uop_sports_v3/navigation/uop_bottom_nav.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool hidePassword = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;
    var screenWidth = screensize.width;
    var screenHeight = screensize.height;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Log into your account',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: screenWidth * 0.05,
                    right: screenWidth * 0.05,
                    top: screenHeight * 0.03,
                    bottom: screenHeight * 0.02),
                child: TextInput(
                  action: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  autofocus: false,
                  labelText: 'Email address',
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: screenWidth * 0.05,
                  right: screenWidth * 0.05,
                  bottom: screenHeight * 0.02,
                ),
                child: PasswordInput(
                  action: TextInputAction.done,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: hidePassword,
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          hidePassword = !hidePassword;
                        });
                      },
                      icon: hidePassword
                          ? const Icon(CupertinoIcons.eye)
                          : const Icon(CupertinoIcons.eye_slash)),
                  controller: passwordController,
                  autofocus: false,
                  labelText: 'Password',
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: screenWidth * 0.05,
                    right: screenWidth * 0.05,
                    bottom: screenHeight * 0.02),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Text(
                        'Forgot Password',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: Colors.blue),
                      ),
                    )
                  ],
                ),
              ),
              PrimaryButton(
                buttonText: 'Sign in',
                onPressed: () {
                  navigatorKey.currentState?.pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => const UopBottomNavBar()),
                    (Route<dynamic> route) => false,
                  );
                },
                isEnabled: true,
              ),
              const OrDivider(),
              GoogleButton(
                buttonText: 'Continue with google',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

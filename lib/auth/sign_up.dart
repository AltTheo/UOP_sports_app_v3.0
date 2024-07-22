import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uop_sports_v3/components/buttons/primary_button.dart';
import 'package:uop_sports_v3/components/input/password_input.dart';
import 'package:uop_sports_v3/components/input/text_input.dart';
import 'package:uop_sports_v3/navigation/global_key.dart';
import 'package:uop_sports_v3/screens/services/services.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool hidePassword = true;
  TextEditingController nameController = TextEditingController();
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
                'Create a new account',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: screenWidth * 0.05,
                    right: screenWidth * 0.05,
                    top: screenHeight * 0.03),
                child: TextInput(
                  action: TextInputAction.next,
                  keyboardType: TextInputType.name,
                  controller: nameController,
                  autofocus: false,
                  labelText: 'Full name',
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: screenWidth * 0.05,
                    right: screenWidth * 0.05,
                    top: screenHeight * 0.020,
                    bottom: 20.0),
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
                    bottom: screenHeight * 0.04),
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
              PrimaryButton(
                buttonText: 'Continue',
                onPressed: () {
                  navigatorKey.currentState?.pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => const Services()),
                    (Route<dynamic> route) => false,
                  );
                },
                isEnabled: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

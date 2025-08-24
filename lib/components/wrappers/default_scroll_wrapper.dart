import 'package:flutter/material.dart';

class DefaultScrollWrapper extends StatelessWidget {
  const DefaultScrollWrapper({super.key, this.appBar, required this.child});

  final AppBar? appBar;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar,
      body: SingleChildScrollView(child: child),
    );
  }
}

import 'package:flutter/material.dart';

class DefaultWrapper extends StatelessWidget {
  const DefaultWrapper({super.key, required this.child, this.appBar});

  final Widget child;
  final AppBar? appBar;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: appBar,
      body: child,
    );
  }
}

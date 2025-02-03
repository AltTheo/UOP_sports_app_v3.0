import 'package:flutter/material.dart';
import 'package:uop_sports_v3/components/buttons/bell_button.dart';

class UopAppBar {
  UopAppBar._();

  static Image appLogo = const Image(
    image: AssetImage(''),
  );
  static AppBar actionedAppBar(List<Widget>? widget, String title) {
    return AppBar(
      title: Text(title),
      actions: widget,
    );
  }

  static List<Widget> notiIcon = <Widget>[const BellButton()];
}

import 'package:flutter/material.dart';
import 'package:uop_sports_v3/common/app_features/app_logo.dart';
import 'package:uop_sports_v3/components/buttons/bell_button.dart';

class UopAppBar {
  UopAppBar._();

  static Image appLogo = const Image(
    image: AssetImage(''),
  );
  static AppBar actionedAppBar(List<Widget>? widget, String title) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(
          UopAppLogo.uopSingleLogo,
          fit: BoxFit.contain,
        ),
      ),
      title: Text(title),
      actions: widget,
    );
  }

  static AppBar staticAppBar(String title) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(
          UopAppLogo.uopSingleLogo,
          fit: BoxFit.contain,
        ),
      ),
      title: Text(title),
    );
  }

  static AppBar tabAppBar(PreferredSizeWidget tabWidget, String title) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(
          UopAppLogo.uopSingleLogo,
          fit: BoxFit.contain,
        ),
      ),
      bottom: tabWidget,
      title: Text(title),
    );
  }

  static List<Widget> notiIcon = <Widget>[const BellButton()];
}

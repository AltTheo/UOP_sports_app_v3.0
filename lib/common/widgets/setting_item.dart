import 'package:flutter/material.dart';

class SettingItem extends StatelessWidget {
  const SettingItem(
      {super.key,
      required this.onTap,
      required this.title,
      this.icons,
      this.trailing});
  final void Function() onTap;
  final String title;
  final IconData? icons;
  final Widget? trailing;
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenHeight = screenSize.height;
    return Padding(
        padding: EdgeInsets.only(bottom: screenHeight * 0.01),
        child: ListTile(
          enableFeedback: false,
          onTap: onTap,
          leading: Icon(
            icons,
            size: 25.0,
          ),
          title: Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
          ),
          trailing: trailing,
        ));
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uop_sports_v3/utils/helper/open_notification.dart';

class BellButton extends StatelessWidget {
  const BellButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          showNotification(context, title: 'title', body: 'body');
        },
        icon: const Icon(
          CupertinoIcons.bell,
          size: 25,
          color: Colors.black,
        ));
  }
}

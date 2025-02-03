import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BellButton extends StatelessWidget {
  const BellButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {},
        icon: const Icon(
          CupertinoIcons.bell,
          size: 25,
          color: Colors.black,
        ));
  }
}

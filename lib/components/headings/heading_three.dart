import 'package:flutter/material.dart';

class HeadingThree extends StatelessWidget {
  const HeadingThree({super.key, required this.title,required this.color});

  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
          color: color,
        ),
      ),
    );
  }
}

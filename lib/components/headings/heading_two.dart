import 'package:flutter/material.dart';

class HeadingTwo extends StatelessWidget {
  const HeadingTwo({super.key, required this.title,required this.color});

  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
        color: color,
      ),
    );
  }
}

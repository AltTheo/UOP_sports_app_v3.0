import 'package:flutter/material.dart';

class ClimbPage extends StatefulWidget {
  const ClimbPage({super.key});

  @override
  State<ClimbPage> createState() => _ClimbPageState();
}

class _ClimbPageState extends State<ClimbPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'UOP Climb will be available soon',
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        // SearchInput(
        //     controller: searchController,
        //     autofocus: false,
        //     keyboardType: TextInputType.text,
        //     action: TextInputAction.search),
      ],
    );
  }
}

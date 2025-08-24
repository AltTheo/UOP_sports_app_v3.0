import 'package:flutter/material.dart';
import 'package:uop_sports_v3/components/input/search_input.dart';

class SwimPage extends StatefulWidget {
  const SwimPage({super.key});

  @override
  State<SwimPage> createState() => _SwimPageState();
}

class _SwimPageState extends State<SwimPage> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'UOP Swimming will be available soon',
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
      ),
    );
  }
}

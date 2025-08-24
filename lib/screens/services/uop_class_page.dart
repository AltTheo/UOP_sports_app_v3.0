import 'package:flutter/material.dart';
import 'package:uop_sports_v3/components/input/search_input.dart';
import 'package:uop_sports_v3/components/wrappers/default_wrapper.dart';

class UopClasses extends StatefulWidget {
  const UopClasses({super.key});

  @override
  State<UopClasses> createState() => _UopClassesState();
}

class _UopClassesState extends State<UopClasses> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return DefaultWrapper(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'UOP Classes will be available soon',
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

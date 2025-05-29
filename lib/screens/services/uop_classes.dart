import 'package:flutter/material.dart';
import 'package:uop_sports_v3/components/input/search_input.dart';

class UopClasses extends StatefulWidget {
  const UopClasses({super.key});

  @override
  State<UopClasses> createState() => _UopClassesState();
}

class _UopClassesState extends State<UopClasses> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SearchInput(
              controller: searchController,
              autofocus: false,
              keyboardType: TextInputType.text,
              action: TextInputAction.search),
        ],
      ),
    );
  }
}

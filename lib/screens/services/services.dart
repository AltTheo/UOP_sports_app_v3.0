import 'package:flutter/material.dart';
import 'package:uop_sports_v3/screens/services/gym.dart';
import 'package:uop_sports_v3/screens/services/sports.dart';

class Services extends StatefulWidget {
  const Services({super.key});

  @override
  State<Services> createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(dividerColor: Colors.transparent, tabs: [
            Tab(
              text: 'Gym',
            ),
            Tab(
              text: 'Sports',
            ),
            Tab(
              text: 'Classes',
            ),
            Tab(
              text: 'Swim',
            ),
            Tab(
              text: 'Climb',
            ),
          ]),
          title: const Text('Services'),
        ),
        body: const TabBarView(children: [
          Gym(),
          Sports(),
          Center(
            child: Text('View 3'),
          ),
          Center(
            child: Text('View 4'),
          ),
          Center(
            child: Text('View 5'),
          )
        ]),
      ),
    );
  }
}

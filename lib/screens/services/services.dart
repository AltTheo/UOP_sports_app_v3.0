import 'package:flutter/material.dart';
import 'package:uop_sports_v3/common/app_features/app_bar.dart';
import 'package:uop_sports_v3/screens/Gym/gym.dart';
import 'package:uop_sports_v3/screens/services/sports.dart';
import 'package:uop_sports_v3/screens/services/uop_classes.dart';

class Services extends StatefulWidget {
  const Services({super.key});

  @override
  State<Services> createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: UopAppBar.tabAppBar(
            const TabBar(dividerColor: Colors.transparent, tabs: [
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
            'Services'),
        body: const TabBarView(children: [
          Sports(),
          UopClasses(),
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

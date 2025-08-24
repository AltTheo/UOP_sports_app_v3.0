import 'package:flutter/material.dart';
import 'package:uop_sports_v3/common/app_features/app_bar.dart';
import 'package:uop_sports_v3/components/wrappers/default_wrapper.dart';
import 'package:uop_sports_v3/screens/Gym/gym.dart';
import 'package:uop_sports_v3/screens/services/climb_page.dart';
import 'package:uop_sports_v3/screens/services/sports_page.dart';
import 'package:uop_sports_v3/screens/services/swim_page.dart';
import 'package:uop_sports_v3/screens/services/uop_class_page.dart';

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
      child: DefaultWrapper(
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
        child: const TabBarView(
            children: [SportsPage(), UopClasses(), SwimPage(), ClimbPage()]),
      ),
    );
  }
}

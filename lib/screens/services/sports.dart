import 'package:flutter/material.dart';

class Sports extends StatefulWidget {
  const Sports({super.key});

  @override
  State<Sports> createState() => _SportsState();
}

class _SportsState extends State<Sports> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenHeight = screenSize.height;
    var screenWidth = screenSize.width;
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: PreferredSize(
            preferredSize: const Size.fromHeight(48.0),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                height: screenHeight * 0.06,
                width: screenWidth,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                  dividerColor: Colors.transparent,
                  labelColor: Theme.of(context).colorScheme.onPrimary,
                  indicatorPadding: EdgeInsets.zero,
                  indicator: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(20)),
                  tabs: const [
                    Tab(
                      text: 'Badminton',
                    ),
                    Tab(
                      text: 'Squash',
                    ),
                    Tab(
                      text: 'Squash double',
                    ),
                    Tab(
                      text: 'Table Tennis',
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }
}

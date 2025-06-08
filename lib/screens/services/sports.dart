import 'package:flutter/material.dart';
import 'package:uop_sports_v3/common/app_features/images.dart';
import 'package:uop_sports_v3/common/widgets/service_grid.dart';
import 'package:uop_sports_v3/screens/services/service_model.dart';

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
                  // height: screenHeight * 0.06,
                  width: screenWidth,
                  decoration: BoxDecoration(
                    // color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 0.9
                              // crossAxisSpacing: 0.3,
                              ),
                      itemCount: sportsGrid.length,
                      itemBuilder: (BuildContext context, int index) {
                        final sports = sportsGrid[index];
                        return ServiceCard(
                          caption: sports.name,
                          image: sports.imageUrl,
                        );
                      })),
            )),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:uop_sports_v3/common/app_features/images.dart';
import 'package:uop_sports_v3/common/widgets/info_bubble.dart';

class Discover extends StatefulWidget {
  const Discover({super.key});

  @override
  State<Discover> createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {
  final List<Map<String, String>> discoverInfo = [
    {
      'image': UopImages.swimImage,
      'infoText':
          'Portsmouth\'s swimming team surges ahead at Varsity, making waves with exceptional performances and triumphant victories.',
      'caption': 'Team X sweeps out varsity!',
    },
    {
      'image': UopImages.swimImage2,
      'infoText':
          'Portsmouth\'s swimming team surges ahead at Varsity, making waves with exceptional performances and triumphant victories.',
      'caption': 'What a beautiful day!',
    },
    {
      'image': UopImages.swimImage,
      'infoText':
          'Portsmouth\'s swimming team surges ahead at Varsity, making waves with exceptional performances and triumphant victories.',
      'caption': 'What a beautiful day!',
    },
    {
      'image': UopImages.swimImage,
      'infoText':
          'Portsmouth\'s swimming team surges ahead at Varsity, making waves with exceptional performances and triumphant victories.',
      'caption': 'What a beautiful day!',
    }
    // Add more posts here
  ];
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenHeight = screenSize.height;
    var screenWidth = screenSize.width;
    return Scaffold(
      drawer: Container(
        width: screenWidth * 0.75,
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      appBar: AppBar(
        title: const Text('Discover'),
      ),
      body: RefreshIndicator.adaptive(
        onRefresh: () async {},
        child: ListView.builder(
            itemCount: discoverInfo.length,
            itemBuilder: (context, index) {
              final info = discoverInfo[index];
              return InfoCard(
                  caption: info['caption'],
                  image: info['image'],
                  infoText: info['infoText']);
            }),
      ),
    );
  }
}

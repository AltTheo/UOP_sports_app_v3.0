import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  const InfoCard(
      {super.key,
      required this.caption,
      required this.image,
      required this.infoText});
  final String? caption;
  final String? image;
  final String? infoText;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenHeight = screenSize.height;
    var screenWidth = screenSize.width;
    return Padding(
      padding: EdgeInsets.only(
          left: screenWidth * 0.06,
          right: screenWidth * 0.06,
          top: screenHeight * 0.02,
          bottom: screenHeight * 0.02),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: screenWidth * 0.95,
                height: screenHeight * 0.32,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage(image!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 5,
                right: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(caption!,
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge
                            ?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w700)),
                    SizedBox(height: screenHeight * 0.02),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
                top: screenHeight * 0.01,
                left: screenWidth * 0.02,
                right: screenWidth * 0.02),
            child:
                Text(infoText!, style: Theme.of(context).textTheme.bodyMedium),
          ),
        ],
      ),
    );
  }
}

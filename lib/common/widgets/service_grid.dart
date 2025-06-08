import 'package:flutter/material.dart';

class ServiceCard extends StatelessWidget {
  const ServiceCard({
    super.key,
    required this.caption,
    required this.image,
    this.ontap,
  });
  final String? caption;
  final String? image;
  final void Function()? ontap;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenHeight = screenSize.height;
    var screenWidth = screenSize.width;
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: EdgeInsets.only(
            left: screenWidth * 0.06,
            right: screenWidth * 0.06,
            top: screenHeight * 0.02,
            bottom: screenHeight * 0.02),
        child: Stack(
          children: [
            Container(
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
              left: 0,
              right: 0,
              child: Container(
                height: screenHeight * 0.2,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  gradient: LinearGradient(
                    colors: [
                      Theme.of(context)
                          .colorScheme
                          .primary
                          .withValues(alpha: 0.6),
                      Theme.of(context)
                          .colorScheme
                          .primary
                          .withValues(alpha: 0.8),
                      Colors.transparent,
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 5,
              left: 10,
              right: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(caption!,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w700)),
                  SizedBox(height: screenHeight * 0.02),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class TimeSlot extends StatefulWidget {
  const TimeSlot({
    super.key,
    this.onTap,
    required this.spaceLeft,
    required this.time,
    required this.isSelected,
    this.slotColor,
    required this.borderColor,
  });

  final void Function()? onTap;
  final String spaceLeft;
  final String time;
  final bool isSelected;
  final Color? slotColor;
  final Color borderColor;

  @override
  State<TimeSlot> createState() => _TimeSlotState();
}

class _TimeSlotState extends State<TimeSlot> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenHeight = screenSize.height;
    var screenWidth = screenSize.width;
    return Padding(
      padding: EdgeInsets.only(
        top: screenHeight * 0.02,
        left: screenWidth * 0.05,
        right: screenWidth * 0.07,
      ),
      child: InkWell(
        onTap: () {
          widget.onTap?.call();
          setState(() {}); // Update state on tap
        },
        child: Container(
          height: screenHeight * 0.09,
          decoration: BoxDecoration(
              color: widget.isSelected ? widget.slotColor : Colors.grey[50],
              border: Border.all(
                  width: screenWidth * 0.001,
                  color: widget.isSelected
                      ? widget.borderColor
                      : Colors.transparent),
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: screenWidth * 0.05,
                    right: screenWidth * 0.05,
                    top: screenHeight * 0.025),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(widget.time,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(fontWeight: FontWeight.w500)),
                    Text(
                      'Spaces left: ${widget.spaceLeft}',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

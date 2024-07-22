import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uop_sports_v3/components/buttons/book_button.dart';
import 'package:uop_sports_v3/components/buttons/primary_button.dart';
import 'package:uop_sports_v3/navigation/global_key.dart';

class Gym extends StatefulWidget {
  const Gym({super.key});

  @override
  State<Gym> createState() => _GymState();
}

class _GymState extends State<Gym> {
  final List<bool> _isSelected = [true, false];
  DateTime _selectedDateTime = DateTime.now();
  String spacesLeft = '98';
  bool isTimeSelected = false;
  int selectedMinutes = 60;
  DateTime roundToNearest15(DateTime dateTime) {
    int minute = dateTime.minute;
    int mod = minute % 15;
    if (mod < 8) {
      minute -= mod;
    } else {
      minute += (15 - mod);
    }
    return DateTime(
        dateTime.year, dateTime.month, dateTime.day, dateTime.hour, minute);
  }

  @override
  void initState() {
    super.initState();
    _selectedDateTime = roundToNearest15(_selectedDateTime);
  }

  void updateSelection(int index) {
    setState(() {
      for (int i = 0; i < _isSelected.length; i++) {
        _isSelected[i] = i == index;
      }
    });
  }

  String formatTime(DateTime dateTime) {
    final DateFormat formatter = DateFormat.Hm();
    return formatter.format(dateTime);
  }

  DateTime addMinutes(DateTime dateTime, int minutes) {
    return dateTime.add(Duration(minutes: minutes));
  }

  @override
  Widget build(BuildContext context) {
    final DateTime today = DateTime.now();
    final DateTime tomorrow = today.add(const Duration(days: 1));
    var screenSize = MediaQuery.of(context).size;
    var screenHeight = screenSize.height;
    var screenWidth = screenSize.width;

    void showiOSTimePicker() {
      showModalBottomSheet(
          context: context,
          builder: (context) => SizedBox(
              height: screenHeight * 0.4,
              child: CupertinoDatePicker(
                minuteInterval: 15,
                mode: CupertinoDatePickerMode.time,
                initialDateTime: _selectedDateTime,
                onDateTimeChanged: (DateTime newDateTime) {
                  setState(() {
                    _selectedDateTime = roundToNearest15(newDateTime);
                  });
                },
                minimumDate:
                    DateTime(today.year, today.month, today.day, 6, 30),
                maximumDate:
                    DateTime(today.year, today.month, today.day, 23, 45),
              )));
    }

    Future<void> showAndroidTimePicker() async {
      final TimeOfDay? picked = await showTimePicker(
        context: context,
        initialTime: TimeOfDay(
            hour: _selectedDateTime.hour, minute: _selectedDateTime.minute),
        initialEntryMode: TimePickerEntryMode.dial,
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
            child: child!,
          );
        },
      );
      if (picked != null) {
        setState(() {
          final DateTime newDateTime = DateTime(
            today.year,
            today.month,
            today.day,
            picked.hour,
            (picked.minute / 15).round() * 15,
          );
          if (newDateTime.isAfter(
                  DateTime(today.year, today.month, today.day, 6, 30)) &&
              newDateTime.isBefore(
                  DateTime(today.year, today.month, today.day, 23, 45))) {
            _selectedDateTime = newDateTime;
          }
        });
      }
    }

    return Scaffold(
        body: Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
              top: screenHeight * 0.02, bottom: screenHeight * 0.02),
          child: ToggleButtons(
            borderRadius: BorderRadius.circular(20),
            fillColor: Theme.of(context).colorScheme.primary,
            selectedColor: Theme.of(context).colorScheme.onPrimary,
            isSelected: _isSelected,
            onPressed: (index) {
              setState(() {
                if (index == 0) {
                  selectedMinutes = 60;
                } else {
                  selectedMinutes = 90;
                }
              });
              updateSelection(index);
            },
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: screenHeight * 0.02,
                    bottom: screenHeight * 0.02,
                    left: screenWidth * 0.03,
                    right: screenWidth * 0.03),
                child: const Text('60 mins'),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: screenHeight * 0.02,
                    bottom: screenHeight * 0.02,
                    left: screenWidth * 0.03,
                    right: screenWidth * 0.03),
                child: const Text('90 mins'),
              ),
            ],
          ),
        ),
        SizedBox(
          height: screenHeight * 0.35,
          child: CalendarDatePicker(
            currentDate: today,
            initialDate: today,
            firstDate: today,
            lastDate: DateTime(today.year, 12, 31),
            selectableDayPredicate: (day) {
              return day.year == today.year &&
                  day.month == today.month &&
                  day.day == today.day;
            },
            onDateChanged: (value) {
              debugPrint(value.toString());
            },
          ),
        ),
        isTimeSelected
            ? InkWell(
                onTap: () {
                  setState(() {});
                  Platform.isIOS
                      ? showiOSTimePicker()
                      : showAndroidTimePicker();
                },
                child: Padding(
                  padding: EdgeInsets.only(
                      top: screenHeight * 0.02,
                      left: screenWidth * 0.05,
                      right: screenWidth * 0.07,
                      bottom: screenHeight * 0.03),
                  child: Container(
                    height: screenHeight * 0.09,
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: screenWidth * 0.05,
                              right: screenWidth * 0.05,
                              top: screenHeight * 0.01),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Gym Booking',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(fontWeight: FontWeight.w500)),
                              Text(
                                'Spaces left: $spacesLeft',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: screenWidth * 0.05,
                              right: screenWidth * 0.05,
                              top: screenHeight * 0.015),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  '${formatTime(_selectedDateTime)} - ${formatTime(addMinutes(_selectedDateTime, selectedMinutes))}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(fontWeight: FontWeight.w500)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            : InkWell(
                onTap: () {
                  setState(() {
                    isTimeSelected = true;
                  });
                  Platform.isIOS
                      ? showiOSTimePicker()
                      : showAndroidTimePicker();
                },
                child: Padding(
                  padding: EdgeInsets.only(
                      top: screenHeight * 0.02,
                      left: screenWidth * 0.05,
                      right: screenWidth * 0.07,
                      bottom: screenHeight * 0.03),
                  child: Container(
                    height: screenHeight * 0.09,
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: screenWidth * 0.05,
                              right: screenWidth * 0.3,
                              top: screenHeight * 0.03),
                          child: Text(
                            'click to select time',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(fontWeight: FontWeight.w300),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
        const Spacer(),
        Padding(
          padding: EdgeInsets.only(
              left: screenWidth * 0.05,
              right: screenWidth * 0.03,
              bottom: screenHeight * 0.02),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    '£5.50',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium
                        ?.copyWith(fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'Total cost',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              BookButton(
                buttonText: 'Book now',
                onPressed: () {},
                isEnabled: isTimeSelected,
              ),
            ],
          ),
        ),
      ],
    ));
  }
}

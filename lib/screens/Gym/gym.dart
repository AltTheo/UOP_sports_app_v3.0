import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:uop_sports_v3/common/app_features/app_bar.dart';
import 'package:uop_sports_v3/navigation/global_key.dart';
import 'package:uop_sports_v3/utils/device/system_alert.dart';
import 'package:uop_sports_v3/utils/provider/refresh_screen.dart';
import 'package:uop_sports_v3/utils/provider/time_slot_provider.dart';
import 'package:uop_sports_v3/common/widgets/booking_info.dart';
import 'package:uop_sports_v3/common/widgets/time_slot.dart';
import 'package:uop_sports_v3/components/buttons/book_button.dart';

class Gym extends StatefulWidget {
  const Gym({super.key});

  @override
  State<Gym> createState() => GymState();
}

class GymState extends State<Gym> with AutomaticKeepAliveClientMixin {
  final List<bool> _isSelected = [true, false];
  DateTime _selectedDateTime = DateTime.now();
  int selectedMinutes = 60;
  DateTime? initialTime;
  List<Map<String, dynamic>> timeSlots = [];

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
    _generateTimeSlots();
    Provider.of<RefreshProvider>(context, listen: false).setGymState(this);
  }

  void refreshPage() async {
    debugPrint('refreshing the gym page');
    _selectedDateTime = roundToNearest15(_selectedDateTime);
    _generateTimeSlots();
  }

  void _generateTimeSlots() {
    final DateTime today = DateTime.now();
    DateTime startTime = DateTime(today.year, today.month, today.day, 6, 30);
    DateTime endTime = DateTime(today.year, today.month, today.day, 23, 45);
    int spaceCount = 100;
    while (startTime.isBefore(endTime)) {
      timeSlots.add({
        'time': startTime,
        'capacity': spaceCount.toString(),
      });
      startTime = startTime.add(const Duration(minutes: 15));
      spaceCount -= 1;
    }
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
    super.build(context);
    final DateTime today = DateTime.now();
    var screenSize = MediaQuery.of(context).size;
    var screenHeight = screenSize.height;
    var screenWidth = screenSize.width;
    final provider = Provider.of<TimeSlotProvider>(context);
    String cost = provider.isTimeSelected
        ? (selectedMinutes == 60
            ? '£5.50'
            : selectedMinutes == 90
                ? '£7.00'
                : '£0.00')
        : '£0.00';
    void showLoadDialog() {
      showAdaptiveDialog(
          barrierDismissible: true,
          context: context,
          builder: (context) => const CircularProgressIndicator.adaptive());
    }

    void bookSession() async {
      showLoadDialog();
      if (!mounted) return;
      Provider.of<TimeSlotProvider>(context, listen: false).resetSelection();
      final newBooking = {
        'bookingType': 'Gym Booking',
        'minutes': selectedMinutes.toString(),
        'bookedTime': formatTime(initialTime ?? DateTime.now()),
        'date': DateFormat('yyyy-MM-dd').format(DateTime.now())
      };
      debugPrint('sending to bookings');
      final parentState = Provider.of<RefreshProvider>(context, listen: false)
          .getBookingListState();
      if (parentState != null) {
        parentState.addBooking(newBooking);
      }
      navigatorKey.currentState?.pop();
      // ignore: use_build_context_synchronously
      SystemAlert.showSnackBar(context, 'Booking successful');
    }

    void showGymTimePicker() {
      showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (context) {
            var provider = Provider.of<TimeSlotProvider>(context);
            return Padding(
              padding: EdgeInsets.only(top: screenHeight * 0.01),
              child: SizedBox(
                height: screenHeight * 0.85,
                child: Column(
                  children: [
                    SizedBox(
                      height: screenHeight * 0.75,
                      child: ListView.builder(
                        itemCount: timeSlots.length,
                        itemBuilder: (context, index) {
                          final timeSlot = timeSlots[index];
                          return TimeSlot(
                            onTap: () {
                              provider.selectTimeSlot(
                                index,
                                timeSlot['time'],
                                timeSlot['capacity'],
                                Theme.of(context).colorScheme.primaryContainer,
                              );
                              setState(() {
                                initialTime = timeSlot['time'];
                              });
                            },
                            spaceLeft: timeSlot['capacity'],
                            time: formatTime(timeSlot['time']),
                            isSelected: provider.tempSelectedIndex == index,
                            slotColor: provider.tempSlotColorState,
                            borderColor: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer,
                          );
                        },
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: EdgeInsets.only(bottom: screenHeight * 0.03),
                      child: TextButton(
                          onPressed: () {
                            provider.confirmSelection();
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Confirm',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color:
                                        Theme.of(context).colorScheme.primary),
                          )),
                    ),
                  ],
                ),
              ),
            );
          });
    }

    return Scaffold(
      appBar: UopAppBar.staticAppBar('Gym'),
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
          Consumer<TimeSlotProvider>(
            builder: (context, provider, child) {
              return provider.isTimeSelected
                  ? BookingInfo(
                      onTap: () {
                        showGymTimePicker();
                      },
                      bookingType: 'Gym Booking',
                      startTime: formatTime(provider.selectedDateTime),
                      endTime: formatTime(addMinutes(
                          provider.selectedDateTime, selectedMinutes)),
                      spaceLeft: provider.spacesLeft!,
                    )
                  : InkWell(
                      onTap: () {
                        showGymTimePicker();
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
                              color: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer,
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
                    );
            },
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
                      cost,
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(fontWeight: FontWeight.w800),
                    ),
                    Text(
                      'Total cost',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
                BookButton(
                  buttonText: 'Book now',
                  onPressed: () {
                    provider.isTimeSelected ? bookSession() : null;
                  },
                  isEnabled: provider.isTimeSelected,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

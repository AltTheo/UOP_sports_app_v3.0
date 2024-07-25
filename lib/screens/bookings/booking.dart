import 'package:flutter/material.dart';
import 'package:uop_sports_v3/screens/bookings/booking_list.dart';
import 'package:uop_sports_v3/utils/provider/refresh_screen.dart';
import 'package:provider/provider.dart';

class Bookings extends StatefulWidget {
  const Bookings({super.key});

  @override
  State<Bookings> createState() => BookingsState();
}

class BookingsState extends State<Bookings> {
  final List<Map<String, String>> bookedInfo = [
    {
      'bookingType': 'Gym Booking',
      'minutes': '90',
      'bookedTime': '06:30',
      'date': '2024-07-23'
    },
    {
      'bookingType': 'Swim Booking',
      'minutes': '60',
      'bookedTime': '08:00',
      'date': '2024-07-23'
    },
    {
      'bookingType': 'Climb Booking',
      'minutes': '90',
      'bookedTime': '13:30',
      'date': '2024-07-19'
    },
    {
      'bookingType': 'Class Booking',
      'minutes': '90',
      'bookedTime': '18:30',
      'date': '2024-06-23'
    },
    {
      'bookingType': 'Class Booking',
      'minutes': '90',
      'bookedTime': '18:30',
      'date': '2024-08-23'
    },
    {
      'bookingType': 'Gym Booking',
      'minutes': '90',
      'bookedTime': '18:30',
      'date': '2024-09-23'
    },
  ];

  Map<String, List<Map<String, String>>> categorizeBookings() {
    final Map<String, List<Map<String, String>>> categorizedBookings = {
      'upcoming': [],
      'history': []
    };
    final currentDate = DateTime.now();

    for (var booking in bookedInfo) {
      final bookingDate = DateTime.parse(booking['date']!);
      if (bookingDate.isAfter(currentDate)) {
        categorizedBookings['upcoming']!.add(booking);
      } else {
        categorizedBookings['history']!.add(booking);
      }
    }
    return categorizedBookings;
  }

  final List<bool> _isSelected = [true, false];

  void updateSelection(int index) {
    setState(() {
      for (int i = 0; i < _isSelected.length; i++) {
        _isSelected[i] = i == index;
      }
    });
  }

  late Future<Map<String, List<Map<String, String>>>>
      _categorizedBookingsFuture;

  @override
  void initState() {
    super.initState();
    _categorizedBookingsFuture = fetchCategorizedBookings();
    fetchCategorizedBookings();
    Provider.of<RefreshProvider>(context, listen: false).setBookingState(this);
  }

  Future<Map<String, List<Map<String, String>>>>
      fetchCategorizedBookings() async {
    await Future.delayed(const Duration(seconds: 2)); // Simulate network delay
    return categorizeBookings();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenHeight = screenSize.height;
    var screenWidth = screenSize.width;
    final categorizedBookings = categorizeBookings();
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(48.0),
              child: Container(
                height: screenHeight * 0.06,
                width: screenWidth * 0.55,
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
                      text: 'Upcoming',
                    ),
                    Tab(
                      text: 'History',
                    )
                  ],
                ),
              )),
          title: const Text('Bookings'),
        ),
        body: FutureBuilder<Map<String, List<Map<String, String>>>>(
          future: _categorizedBookingsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator.adaptive());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData) {
              return const Center(child: Text('No bookings available'));
            } else {
              final categorizedBookings = snapshot.data!;
              return ChangeNotifierProvider.value(
                value: Provider.of<RefreshProvider>(context),
                child: TabBarView(
                  children: [
                    BookingsList(bookings: categorizedBookings['upcoming']!),
                    BookingsList(bookings: categorizedBookings['history']!),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

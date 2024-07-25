import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:uop_sports_v3/common/widgets/booked_info.dart';
import 'package:uop_sports_v3/utils/provider/refresh_screen.dart';

class BookingsList extends StatelessWidget {
  final List<Map<String, String>> bookings;

  const BookingsList({Key? key, required this.bookings}) : super(key: key);

  List<Widget> buildGroupedBookings(BuildContext context) {
    Map<String, List<Map<String, String>>> groupedBookings = {};
    for (var booking in bookings) {
      final date = booking['date']!;
      if (!groupedBookings.containsKey(date)) {
        groupedBookings[date] = [];
      }
      groupedBookings[date]!.add(booking);
    }

    List<Widget> bookingWidgets = [];
    groupedBookings.forEach((date, bookings) {
      final formattedDate =
          DateFormat('EEEE - MMM d, yyyy').format(DateTime.parse(date));
      bookingWidgets.add(
        Padding(
          padding: const EdgeInsets.only(top: 18.0, left: 18.0, right: 18.0),
          child: Text(
            formattedDate,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
      );
      for (var booking in bookings) {
        bookingWidgets.add(BookedInfo(
          bookingType: booking['bookingType']!,
          minutes: booking['minutes']!,
          bookedTime: booking['bookedTime']!,
        ));
      }
    });

    return bookingWidgets;
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator.adaptive(
      onRefresh: () async {
        await Provider.of<RefreshProvider>(context, listen: false)
            .refreshBookings();
      },
      child: ListView(
        children: buildGroupedBookings(context),
      ),
    );
  }
}

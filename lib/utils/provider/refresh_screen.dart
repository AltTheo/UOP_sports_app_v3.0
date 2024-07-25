import 'package:flutter/material.dart';
import 'package:uop_sports_v3/screens/bookings/booking.dart';

class RefreshProvider extends ChangeNotifier {
  BookingsState? _bookingState;

  void setBookingState(BookingsState bookingState) {
    _bookingState = bookingState;
  }

  Future<void> refreshBookings() async {
    _bookingState!.fetchCategorizedBookings();
    notifyListeners();
  }
}

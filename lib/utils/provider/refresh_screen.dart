import 'package:flutter/material.dart';
import 'package:uop_sports_v3/screens/bookings/booking.dart';
import 'package:uop_sports_v3/screens/bookings/booking_list.dart';

class RefreshProvider extends ChangeNotifier {
  BookingsState? _bookingState;
  BookingsListState? _bookingListState;

  void setBookingState(BookingsState bookingState) {
    _bookingState = bookingState;
  }

  void setBookingListState(BookingsListState bookingListState) {
    _bookingListState = bookingListState;
  }

  Future<void> refreshBookings() async {
    _bookingState!.fetchCategorizedBookings();
    _bookingListState!.reloadWidget();
    notifyListeners();
  }
}

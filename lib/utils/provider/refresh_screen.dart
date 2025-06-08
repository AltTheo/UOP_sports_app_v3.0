import 'package:flutter/material.dart';
import 'package:uop_sports_v3/screens/bookings/booking.dart';
import 'package:uop_sports_v3/screens/bookings/booking_list.dart';
import 'package:uop_sports_v3/screens/Gym/gym.dart';

class RefreshProvider extends ChangeNotifier {
  BookingsState? _bookingState;
  BookingsListState? _bookingListState;
  GymState? _gymState;

  void setBookingState(BookingsState bookingState) {
    _bookingState = bookingState;
  }

  void setGymState(GymState gymState) {
    _gymState = gymState;
  }

  void setBookingListState(BookingsListState bookingListState) {
    _bookingListState = bookingListState;
  }

  BookingsListState? getBookingListState() {
    return _bookingListState;
  }

  Future<void> refreshBookings() async {
    _bookingState!.fetchCategorizedBookings();
    _bookingListState!.reloadWidget();
    notifyListeners();
  }

  Future<void> refreshGymPage() async {
    _gymState!.refreshPage();
  }
}

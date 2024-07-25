import 'package:flutter/material.dart';

class TimeSlotProvider extends ChangeNotifier {
  int? _selectedIndex;
  DateTime _selectedDateTime = DateTime.now();
  bool _isTimeSelected = false;
  String? _spacesLeft;
  Color? _slotColorState;

  int? get selectedIndex => _selectedIndex;
  DateTime get selectedDateTime => _selectedDateTime;
  bool get isTimeSelected => _isTimeSelected;
  String? get spacesLeft => _spacesLeft;
  Color? get slotColorState => _slotColorState;

  void selectTimeSlot(
      int index, DateTime dateTime, String capacity, Color color) {
    _selectedIndex = index;
    _selectedDateTime = dateTime;
    _isTimeSelected = true;
    _spacesLeft = capacity;
    _slotColorState = color;
    notifyListeners();
  }
}

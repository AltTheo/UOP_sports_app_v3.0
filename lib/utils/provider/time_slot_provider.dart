import 'package:flutter/material.dart';

class TimeSlotProvider extends ChangeNotifier {
  int? selectedIndex;
  DateTime selectedDateTime = DateTime.now();
  String? spacesLeft;
  bool isTimeSelected = false;
  Color? slotColorState;

  int? tempSelectedIndex;
  DateTime? tempSelectedDateTime;
  String? tempSpacesLeft;
  Color? tempSlotColorState;

  void selectTimeSlot(
      int index, DateTime dateTime, String capacity, Color slotColor) {
    tempSelectedIndex = index;
    tempSelectedDateTime = dateTime;
    tempSpacesLeft = capacity;
    tempSlotColorState = slotColor;
    notifyListeners();
  }

  void confirmSelection() {
    selectedIndex = tempSelectedIndex;
    selectedDateTime = tempSelectedDateTime!;
    spacesLeft = tempSpacesLeft;
    isTimeSelected = true;
    slotColorState = tempSlotColorState;
    notifyListeners();
  }
}

import 'package:flutter/cupertino.dart';

class UBottomNavBar {
  UBottomNavBar._();

  static List<BottomNavigationBarItem> navBarList = <BottomNavigationBarItem>[
    const BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.home),
      label: 'Home',
      activeIcon: Icon(
        CupertinoIcons.house_fill,
      ),
    ),
    const BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.briefcase),
      label: 'Services',
      activeIcon: Icon(
        CupertinoIcons.briefcase_fill,
      ),
    ),
    const BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.hourglass),
      label: 'Bookings',
      activeIcon: Icon(
        CupertinoIcons.hourglass_bottomhalf_fill,
      ),
    ),
    const BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.person),
      label: 'Profile',
      activeIcon: Icon(
        CupertinoIcons.person_fill,
      ),
    ),
  ];
}

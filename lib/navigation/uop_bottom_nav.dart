import 'package:flutter/material.dart';
import 'package:uop_sports_v3/common/app_features/bottom_nav.dart';
import 'package:uop_sports_v3/screens/bookings/booking.dart';
import 'package:uop_sports_v3/screens/home/discover.dart';
import 'package:uop_sports_v3/screens/profile/profile.dart';
import 'package:uop_sports_v3/screens/services/services.dart';

class UopBottomNavBar extends StatefulWidget {
  const UopBottomNavBar({super.key});

  @override
  State<UopBottomNavBar> createState() => _UopBottomNavBarState();
}

class _UopBottomNavBarState extends State<UopBottomNavBar> {
  int selectedIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  List<Widget> widgetOptions = <Widget>[
    const Discover(),
    const Services(),
    const Bookings(),
    const Profile()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: IndexedStack(
        index: selectedIndex,
        children: List.generate(widgetOptions.length, (index) {
          return widgetOptions[index];
        }),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: List.generate(UBottomNavBar.navBarList.length, (index) {
          var item = UBottomNavBar.navBarList[index];
          return BottomNavigationBarItem(
            icon: item.icon,
            activeIcon: item.activeIcon,
            label: item.label,
          );
        }),
        onTap: (index) {
          onItemTapped(index);
        },
        currentIndex: selectedIndex,
      ),
    );
  }
}

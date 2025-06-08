import 'package:flutter/material.dart';

class CustomNav extends StatelessWidget {
  final List<BottomNavigationBarItem> items;
  final int currentIndex;
  final ValueChanged<int>? onTap;
  final double elevation;
  final BottomNavigationBarType type;
  final Color? selectedItemColor;
  final Color? unselectedItemColor;
  final IconThemeData? selectedIconTheme;
  final IconThemeData? unselectedIconTheme;
  final TextStyle? selectedLabelStyle;
  final TextStyle? unselectedLabelStyle;
  final bool showSelectedLabels;
  final bool showUnselectedLabels;

  const CustomNav({
    required this.items,
    this.currentIndex = 0,
    this.onTap,
    this.elevation = 8.0,
    this.type = BottomNavigationBarType.fixed,
    this.selectedItemColor,
    this.unselectedItemColor,
    this.selectedIconTheme,
    this.unselectedIconTheme,
    this.selectedLabelStyle,
    this.unselectedLabelStyle,
    this.showSelectedLabels = true,
    this.showUnselectedLabels = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(),
      child: BottomNavigationBar(
        items: items,
        currentIndex: currentIndex,
        onTap: onTap,
        elevation: elevation,
        type: type,
        selectedItemColor: selectedItemColor,
        unselectedItemColor: unselectedItemColor,
        selectedIconTheme: selectedIconTheme,
        unselectedIconTheme: unselectedIconTheme,
        selectedLabelStyle: selectedLabelStyle,
        unselectedLabelStyle: unselectedLabelStyle,
        showSelectedLabels: showSelectedLabels,
        showUnselectedLabels: showUnselectedLabels,
        backgroundColor: Colors.white.withValues(alpha: 0.8),
      ),
    );
  }
}

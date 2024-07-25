// lib/widgets/custom_bottom_navigation_bar.dart
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;
  final Color backgroundColor;

  CustomBottomNavigationBar({
    required this.selectedIndex,
    required this.onItemTapped,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: backgroundColor,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Dashboard',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.analytics),
          label: 'Analytics',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today),
          label: 'Appointments',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
      currentIndex: selectedIndex,
      unselectedItemColor: Colors.pink,
      selectedItemColor: Colors.amber[800],
      onTap: onItemTapped,
    );
  }
}

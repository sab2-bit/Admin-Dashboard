import 'package:admin_dashboard/screens/analytics_screen.dart';
import 'package:admin_dashboard/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'screens/appointments_screen.dart';
import 'screens/dashboard_screen.dart';
import 'widgets/custom_bottom_navigation_bar.dart'; // Add this line

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KSY Admin Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AdminDashboard(),
    );
  }
}

class AdminDashboard extends StatefulWidget {
  @override
  _AdminDashboardState createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    DashboardScreen(),
    AppointmentsScreen(),
    AnalyticsScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
        backgroundColor: Colors.red,
      ),
    );
  }
}

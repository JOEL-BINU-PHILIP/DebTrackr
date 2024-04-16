import 'package:debtrackr/CreditsScreen.dart';
import 'package:debtrackr/DuesScreen.dart';
import 'package:debtrackr/dashboardScreen.dart';
import 'package:flutter/material.dart';
class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 1;
  static const List<Widget> _pages = [
    CreditsScreen(),
    DashBoardScreen(),
    DuesScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_circle_up_rounded),
            label: 'Credits',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_circle_down),
            label: 'Dues',
          ),
        ],
        currentIndex: _selectedIndex ,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
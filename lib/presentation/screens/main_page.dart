import 'package:flutter/material.dart';
import 'package:flutter_map_implementation/presentation/screens/polygon_screen.dart';
import 'package:flutter_map_implementation/presentation/screens/polyline_screen.dart';
import 'package:flutter_map_implementation/presentation/screens/user_location_screen.dart';

import 'basic_map_screen.dart';
import 'markers_screen.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Widget> _screens = [
    BasicMapScreen(),
    MarkersScreen(),
    UserLocationScreen(),
    PolylineScreen(),
    PolygonScreen(),
  ];

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.map), label: "Basic"),
          BottomNavigationBarItem(icon: Icon(Icons.place), label: "Markers"),
          BottomNavigationBarItem(icon: Icon(Icons.my_location), label: "Location"),
          BottomNavigationBarItem(icon: Icon(Icons.polyline), label: "Polyline"),
          BottomNavigationBarItem(icon: Icon(Icons.pentagon), label: "Polygon"),
        ],
        currentIndex: _currentIndex,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        selectedItemColor: Colors.blue,
        onTap: (index) {
          return setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

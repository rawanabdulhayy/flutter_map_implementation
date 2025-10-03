import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class BasicMapScreen extends StatelessWidget {
  const BasicMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Basic Map"),
        centerTitle: true,
      ),
      body: FlutterMap(
        options: MapOptions(
          center: LatLng(30.09700787794365, 31.3293234080702), // Cairo coords
          zoom: 13.0,
        ),
        children: [
          TileLayer(
            urlTemplate: "https://api.maptiler.com/maps/streets/{z}/{x}/{y}.png?key=JP1WWaQ58K2ofkjM3oro",
            subdomains: const ['a', 'b', 'c'],
            userAgentPackageName: "com.example.flutter_map_implementation",
          ),
        ],
      ),
    );
  }
}

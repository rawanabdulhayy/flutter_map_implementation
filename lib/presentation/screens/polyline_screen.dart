import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../../utils/constants.dart';

class PolylineScreen extends StatefulWidget {
  const PolylineScreen({super.key});

  @override
  State<PolylineScreen> createState() => _PolylineScreenState();
}

// we wanna differentiate between the point (LatLng), position, LatLng, latitude, longitude.
// LatLng(position.latitude, position.longitude);
class _PolylineScreenState extends State<PolylineScreen> {
  final Set<LatLng> _polyLines = {};

  void _createPolyLine(LatLng point) {
    setState(() {
      _polyLines.add(point);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cairo to Alex Road"),
        centerTitle: true,
      ),
      body: FlutterMap(
        options: MapOptions(
          center: MapConstants.alexandriaLocation,
          zoom: 13.0,
          onTap: (tapPosition, point) => _createPolyLine(point),
        ),
        children: [
          TileLayer(
            urlTemplate:
                "https://api.maptiler.com/maps/streets/{z}/{x}/{y}.png?key=JP1WWaQ58K2ofkjM3oro",
            subdomains: const ['a', 'b', 'c'],
            userAgentPackageName: "com.example.flutter_map_implementation",
          ),
          PolylineLayer(
            polylines: [
              Polyline(
                points: _polyLines.toList(),
                color: Colors.blue,
                strokeWidth: 10,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

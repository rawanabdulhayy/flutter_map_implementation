import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../../utils/constants.dart';

class PolygonScreen extends StatefulWidget {
  const PolygonScreen({super.key});

  @override
  State<PolygonScreen> createState() => _PolygonScreenState();
}

class _PolygonScreenState extends State<PolygonScreen> {
  final Set<LatLng> _polygons = {};
  //34an lpoints el mtkrra mttkrrsh mrten in rendering aw storage.
  void _createPolygon(LatLng point) {
    setState(() {
      _polygons.add(point);
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
          onTap: (tapPosition, point) => _createPolygon(point),
        ),
        children: [
          TileLayer(
            urlTemplate:
                "https://api.maptiler.com/maps/streets/{z}/{x}/{y}.png?key=JP1WWaQ58K2ofkjM3oro",
            subdomains: const ['a', 'b', 'c'],
            userAgentPackageName: "com.example.flutter_map_implementation",
          ),
          PolygonLayer(
            polygons: [
              Polygon(
                points: _polygons.toList(),
                color: Colors.blue[500]!,
                borderStrokeWidth: 3,
                borderColor: Colors.blue,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

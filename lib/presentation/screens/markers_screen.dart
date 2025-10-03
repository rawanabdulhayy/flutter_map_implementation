import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MarkersScreen extends StatefulWidget {
  const MarkersScreen({super.key});

  @override
  State<MarkersScreen> createState() => _MarkersScreenState();
}

class _MarkersScreenState extends State<MarkersScreen> {
  final Set<Marker> _markers = {};

  void _createMarkers (LatLng point){
    setState(() {
      _markers.add(
        Marker(point: point, width: 80, height: 80, anchorPos: AnchorPos.align(AnchorAlign.center), builder: (context){
          return GestureDetector(child: Icon(Icons.location_on_outlined, color: Colors.red,),
            onTap: (){
              final index = _markers.toList().indexWhere((marker) => marker.point == point);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("You tapped marker #$index\nlat: ${point.latitude.toStringAsFixed(5)} and Lng: ${point.longitude.toStringAsFixed(5)}")));
            },
          );
        })
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Markers Map"),
        centerTitle: true,
      ),
      body: FlutterMap(
        options: MapOptions(
          center: LatLng(30.09700787794365, 31.3293234080702), // Cairo coords
          zoom: 13.0,
          onTap: (tapPosition, point){
            //rag3t el point men ldusa, mesh passed it llfunction no, it works the other way around.
            _createMarkers(point);
          },
        ),
        children: [
          TileLayer(
            urlTemplate: "https://api.maptiler.com/maps/streets/{z}/{x}/{y}.png?key=JP1WWaQ58K2ofkjM3oro",
            subdomains: const ['a', 'b', 'c'],
            userAgentPackageName: "com.example.flutter_map_implementation",
          ),
          MarkerLayer(
            markers:
              //[
              // Marker(
              //   point: LatLng(30.0970, 31.3293),
              //   width: 60,
              //   height: 60,
              //   builder: (ctx) => const Icon(
              //     Icons.location_on,
              //     color: Colors.red,
              //     size: 40,
              //   ),
              // ),
              //],
              _markers.toList(),
          ),
        ],
      ),
    );
  }
}

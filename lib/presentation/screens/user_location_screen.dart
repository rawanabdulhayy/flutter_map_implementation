import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_implementation/utils/constants.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:permission_handler/permission_handler.dart';

class UserLocationScreen extends StatefulWidget {
  const UserLocationScreen({super.key});

  @override
  State<UserLocationScreen> createState() => _UserLocationScreenState();
}

class _UserLocationScreenState extends State<UserLocationScreen> {
  LatLng? _currentPosition;
  final Set<Marker> _markers = {};
  MapController controller = MapController();

  @override
  void initState() {
    _requestLocationPermission();
    super.initState();
  }

  Future<void> _getCurrentLocation() async {
    try {
      final position = await Geolocator.getCurrentPosition();
      _currentPosition = LatLng(position.latitude, position.longitude);
      _moveToCurrentLocation();
    } catch (e) {
      print("Error: Couldn't get Location $e");
    }
  }

  Future<void> _requestLocationPermission() async {
    final status = await Permission.location.request();
    if (status.isGranted) {
      _getCurrentLocation();
    }
  }
  // void _moveToCurrentLocation(){
  //   if(_currentPosition != null){
  //     setState(() {
  //       _markers.clear();
  //       _markers.add(
  //         Marker(point: _currentPosition!, builder: (context) {
  //           Icon(Icons.location_on_outlined, color: Colors.red,);
  //         }
  //
  //         )
  //       );
  //     }
  //     controller.move(_currentPosition!, 17);
  //     );
  //   }
  // }

  void _moveToCurrentLocation() {
    if (_currentPosition != null) {
      setState(() {
        _markers.clear();
        _markers.add(
          Marker(
            point: _currentPosition!,
            width: 60,
            height: 60,
            builder: (context) => const Icon(
              Icons.location_on_outlined,
              color: Colors.red,
              size: 40,
            ),
          ),
        );
      });

      controller.move(_currentPosition!, 17);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User's Location Map"),
        centerTitle: true,
      ),
      body: FlutterMap(
        mapController: controller,
        options: MapOptions(
          center: _currentPosition ?? MapConstants.alexandriaLocation,
          zoom: 13.0,
        ),
        children: [
          TileLayer(
            urlTemplate:
                "https://api.maptiler.com/maps/streets/{z}/{x}/{y}.png?key=JP1WWaQ58K2ofkjM3oro",
            subdomains: const ['a', 'b', 'c'],
            userAgentPackageName: "com.example.flutter_map_implementation",
          ),
          MarkerLayer(markers: _markers.toList()),
        ],
      ),
      floatingActionButton: FloatingActionButton(backgroundColor: Colors.white, onPressed: _moveToCurrentLocation, child: Icon(Icons.my_location, color: Colors.blue,),),
    );
  }
}

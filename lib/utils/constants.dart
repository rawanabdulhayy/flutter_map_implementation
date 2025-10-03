import 'package:latlong2/latlong.dart';

class MapConstants {
  // Source and destination
  static LatLng cairoLocation = LatLng(30.09700787794365, 31.3293234080702);
  static LatLng alexandriaLocation = LatLng(29.970795744013652, 31.2823934780062);

  // Default zoom level
  static const double defaultZoom = 10.0;

  // Example locations to mark on the map
  static Map<String, LatLng> mapPlaces = {
    'Egyptian Museum': LatLng(30.04846845986703, 31.23374307992811),
    'Pyramids of Giza': LatLng(29.98453547559629, 31.23147273427023),
  };
}

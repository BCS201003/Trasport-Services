import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';

class LiveDirectionScreen extends StatefulWidget {
  final String fromlocation; // e.g. "Islamabad"
  final String toLocation;   // e.g. "Lahore"

  const LiveDirectionScreen({
    super.key,
    required this.fromlocation,
    required this.toLocation,
  });

  @override
  _LiveDirectionScreenState createState() => _LiveDirectionScreenState();
}

class _LiveDirectionScreenState extends State<LiveDirectionScreen> {
  final MapController _mapController = MapController();

  // Coordinates for the route
  late LatLng _fromLatLng;       // updated to live location if available
  late LatLng _destinationLatLng;

  bool _hasPermission = false;

  // Convert a named location to a LatLng (fallback if GPS not available)
  LatLng getLatLng(String location) {
    Map<String, LatLng> locations = {
      "Islamabad": LatLng(33.6844, 73.0479),
      "G14": LatLng(33.6677, 72.9784),
      "Rawalpindi": LatLng(33.5973, 73.0479),
      "Lahore": LatLng(31.5497, 74.3436),
    };
    // Default to Islamabad if unknown
    return locations[location] ?? LatLng(33.7294, 73.0931);
  }

  @override
  void initState() {
    super.initState();
    // Initially set from/to based on the location names
    _fromLatLng = getLatLng(widget.fromlocation);
    _destinationLatLng = getLatLng(widget.toLocation);

    _requestPermission();
  }

  // Request Location Permissions and subscribe to updates if granted
  Future<void> _requestPermission() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // If GPS is not enabled, open location settings (optional)
      await Geolocator.openLocationSettings();
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Still denied, can't use live location
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions denied forever
      return;
    }

    // Permission is granted at this point
    setState(() => _hasPermission = true);
    _subscribeToLocationUpdates();
  }

  // Listen to position changes and update _fromLatLng to the live location
  void _subscribeToLocationUpdates() {
    Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 5, // update every 5 meters
      ),
    ).listen((Position position) {
      setState(() {
        // Overwrite the "from" coordinate with the user's real location
        _fromLatLng = LatLng(position.latitude, position.longitude);
      });
      // Optionally move the map to the new position
      _mapController.move(_fromLatLng, 16.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    // If we never got permission, we use the fallback _fromLatLng
    // but we do NOT show a live marker. Just keep a static route.

    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.fromlocation} ➔ ${widget.toLocation}'),
        backgroundColor: Colors.black,
      ),
      body: Stack(
        children: [
          // ---------------------------------
          //         Flutter Map
          // ---------------------------------
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              // Center on the "from" coordinate (static or live)
              initialCenter: _fromLatLng,
              initialZoom: 13.0,
            ),
            children: [
              // Base map tiles
              TileLayer(
                urlTemplate:
                "https://api.maptiler.com/maps/basic-v2/{z}/{x}/{y}.png?key=9amPXYzYEX44i7Emfblv",
                userAgentPackageName: 'com.service.transport_service_app',
              ),

              // MarkerLayer for "from" + "to"
              MarkerLayer(
                markers: [
                  // "From" Marker (could be static or real-time if permissions granted)
                  Marker(
                    point: _fromLatLng,
                    width: 50,
                    height: 50,
                    child: const Icon(
                      Icons.location_searching,
                      color: Colors.blue,
                      size: 40,
                    ),
                  ),
                  // Destination Marker
                  Marker(
                    point: _destinationLatLng,
                    width: 50,
                    height: 50,
                    child: const Icon(
                      Icons.location_on,
                      color: Colors.red,
                      size: 40,
                    ),
                  ),
                ],
              ),

              // Single line from "from" to "to"
              PolylineLayer(
                polylines: [
                  Polyline(
                    points: [_fromLatLng, _destinationLatLng],
                    strokeWidth: 5,
                    color: Colors.purpleAccent,
                  ),
                ],
              ),
            ],
          ),

          // ---------------------------------
          //     Optional Info Card
          // ---------------------------------
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Card(
              color: Colors.black54,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  _hasPermission
                      ? 'Live navigation: Your location ➔ ${widget.toLocation}'
                      : 'Static route: ${widget.fromlocation} ➔ ${widget.toLocation}',
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:latlong2/latlong.dart';
//
// class DirectionScreen extends StatelessWidget {
//   final String fromLocation;
//   final String toLocation;
//
//   const DirectionScreen({
//     super.key,
//     required this.fromLocation,
//     required this.toLocation,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     // DEMO: Hard-coded lat/lng for Islamabad & G14
//     final LatLng fromLatLng = LatLng(33.7294, 73.0931);
//     final LatLng toLatLng = LatLng(33.6677, 72.9784);
//
//     return Theme(
//       // Black/white design with 1% accent color
//       data: ThemeData(
//         brightness: Brightness.dark,
//         scaffoldBackgroundColor: Colors.black,
//         colorScheme: ColorScheme.dark(
//           primary: Colors.grey[900]!,
//           onPrimary: Colors.white,
//           secondary: Colors.deepOrangeAccent,
//         ),
//       ),
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('$fromLocation ➔ $toLocation'),
//           backgroundColor: Colors.black,
//           elevation: 2,
//         ),
//         body: SafeArea(
//           child: Stack(
//             children: [
//               /// -- FLUTTER MAP (v7.x syntax) --
//               FlutterMap(
//                 options: MapOptions(
//                   // or use: initialCenter, initialZoom in v7 if you prefer
//                   initialCenter: fromLatLng,
//                   initialZoom: 12.0,
//                 ),
//                 children: [
//                   // 1) TileLayer
//                   TileLayer(
//                     urlTemplate:
//                     "https://api.maptiler.com/maps/basic-v2/{z}/{x}/{y}.png?key=9amPXYzYEX44i7Emfblv",
//                     userAgentPackageName: 'com.service.transport_service_app',
//                   ),
//
//                   // 2) MarkerLayer
//                   MarkerLayer(
//                     markers: [
//                       Marker(
//                         point: fromLatLng,
//                         width: 50,
//                         height: 50,
//                         builder: (ctx) => const Icon(
//                           Icons.location_on,
//                           color: Colors.white,
//                           size: 40,
//                         ),
//                       ),
//
//                       Marker(
//                         point: toLatLng,
//                         width: 50,
//                         height: 50,
//                         builder: (ctx) => const Icon(
//                           Icons.location_on,
//                           color: Colors.deepOrangeAccent,
//                           size: 40,
//                         ),
//                       ),
//                     ],
//                   ),
//                   PolylineLayer(
//                     polylines: [
//                       Polyline(
//                         points: [fromLatLng, toLatLng],
//                         strokeWidth: 4,
//                         color: Colors.white70,
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               /// -- Optional Info Card --
//               Positioned(
//                 bottom: 20,
//                 left: 20,
//                 right: 20,
//                 child: Card(
//                   color: Colors.black54,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   elevation: 4,
//                   child: Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Text(
//                       'Directions from $fromLocation to $toLocation',
//                       style: const TextStyle(fontSize: 16, color: Colors.white),
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
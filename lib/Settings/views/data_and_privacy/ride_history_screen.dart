// lib/views/settings/ride_history_screen.dart
import 'package:flutter/material.dart';

class RideHistoryScreen extends StatelessWidget {
  const RideHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Example: display a list of past rides
    final dummyRides = [
      {'date': '2025-01-12', 'from': 'City A', 'to': 'City B', 'cost': '\$12.00'},
      {'date': '2025-01-14', 'from': 'City B', 'to': 'City C', 'cost': '\$8.50'},
      {'date': '2025-01-20', 'from': 'City C', 'to': 'City A', 'cost': '\$15.25'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ride History'),
      ),
      body: ListView.builder(
        itemCount: dummyRides.length,
        itemBuilder: (context, index) {
          final ride = dummyRides[index];
          return ListTile(
            title: Text('Date: ${ride['date']}'),
            subtitle: Text('From: ${ride['from']} → To: ${ride['to']}'),
            trailing: Text('${ride['cost']}'),
          );
        },
      ),
    );
  }
}

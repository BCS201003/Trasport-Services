import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class GetInTouchScreen extends StatelessWidget {
  const GetInTouchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> universities = [
      {'name': 'University of Lahore', 'contact': '+92 42 111 865 865'},
      {'name': 'National University of Sciences and Technology (NUST)', 'contact': '+92 51 9085 0000'},
      {'name': 'Lahore University of Management Sciences (LUMS)', 'contact': '+92 42 3560 8000'},
      {'name': 'COMSATS University Islamabad', 'contact': '+92 51 9049 1000'},
      {'name': 'University of the Punjab', 'contact': '+92 42 9923 1117'},
      {'name': 'FAST National University', 'contact': '+92 42 111 128 128'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Get in Touch',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: universities.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 8),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: ListTile(
                leading: const Icon(Icons.school, color: Colors.blue),
                title: Text(
                  universities[index]['name']!,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(universities[index]['contact']!),
                trailing: IconButton(
                  icon: const Icon(Icons.call, color: Colors.green),
                  onPressed: () {
                    // Logic to call the university number
                    // In real apps, you can use url_launcher to open dialer
                    if (kDebugMode) {
                      print("Calling ${universities[index]['contact']}");
                    }
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

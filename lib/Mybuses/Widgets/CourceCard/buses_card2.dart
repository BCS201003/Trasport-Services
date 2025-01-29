// lib/Mybuses/Widgets/CourceCard/buses_card2.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
// ignore: unused_import
import '../../Models/mybusmodel.dart';
import '../../Controller/mybus_controller.dart';

class BusCard2 extends StatelessWidget {
  const BusCard2({super.key});

  @override
  Widget build(BuildContext context) {
    final MyBusController controller = Get.find<MyBusController>();

    return Obx(() {
      final buses = controller.buses.where((bus) => bus.type == 'Highyes').toList();

      if (buses.isEmpty) {
        return const Text(
          'No Highyes Buses added yet.',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        );
      }

      return Column(
        children: buses.map((bus) => Card(
          elevation: 3,
          margin: const EdgeInsets.symmetric(vertical: 6.0),
          child: ListTile(
            leading: const Icon(Icons.directions_bus, color: Colors.blue),
            title: Text(bus.name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            subtitle: Text('From: ${bus.source}\nTo: ${bus.destination}'),
            isThreeLine: true,
            trailing: IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                controller.removeBus(bus);
                Get.snackbar(
                  'Removed',
                  'Highyes Bus removed successfully',
                  backgroundColor: Colors.red,
                  colorText: Colors.white,
                  snackPosition: SnackPosition.BOTTOM,
                );
              },
            ),
          ),
        )).toList(),
      );
    });
  }
}

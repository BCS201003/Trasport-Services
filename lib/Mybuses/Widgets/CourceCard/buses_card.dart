// lib/Mybuses/Widgets/CourceCard/buses_card.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Models/mybusmodel.dart';
import '../../Controller/mybus_controller.dart';

class BusCard extends StatelessWidget {
  const BusCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MyBusController controller = Get.find<MyBusController>();

    return Obx(() {
      final buses = controller.buses.where((bus) => bus.type == 'Carry').toList();

      if (buses.isEmpty) {
        return const Text(
          'No Carry Buses added yet.',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        );
      }
      return Column(
        children: buses.map((bus) => Card(
          elevation: 3,
          margin: const EdgeInsets.symmetric(vertical: 6.0),
          child: ListTile(
            leading: const Icon(Icons.local_shipping, color: Colors.orange),
            title: Text(bus.name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            subtitle: Text('From: ${bus.source}\nTo: ${bus.destination}'),
            isThreeLine: true,
            trailing: IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                controller.removeBus(bus);
                Get.snackbar(
                  'Removed',
                  'Carry Bus removed successfully',
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

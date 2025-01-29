// lib/Mybuses/my_buses.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Widgets/my_buses_dashboard.dart';
import 'package:untitled/Widgets/Appbar/custom_appbar.dart';
import 'Controller/mybus_controller.dart';


class MyBusesScreen extends StatefulWidget {
  const MyBusesScreen({super.key});

  @override
  State<MyBusesScreen> createState() => MyBusesScreenState();
}

class MyBusesScreenState extends State<MyBusesScreen> {
  final TextEditingController _highyesBusController = TextEditingController();
  final TextEditingController _carryBusController = TextEditingController();

  @override
  void dispose() {
    _highyesBusController.dispose();
    _carryBusController.dispose();
    super.dispose();
  }

  // Method to add Highyes Bus
  void _addHighyesBus() {
    final busName = _highyesBusController.text.trim();
    if (busName.isNotEmpty) {
      Get.find<MyBusController>().addBus(
        type: 'Highyes', // or 'Carry'
        name: 'Bus 101',
        source: 'Station A',
        destination: 'Station B',
      );
      _highyesBusController.clear();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Highyes Bus added successfully'),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Highyes Bus name cannot be empty'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void _addCarryBus() {
    final busName = _carryBusController.text.trim();
    if (busName.isNotEmpty) {
      Get.find<MyBusController>().addBus(
        type: 'Carry', // or 'Carry'
        name: 'Bus 101',
        source: 'Station A',
        destination: 'Station B',
      );
      _carryBusController.clear();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Carry Bus added successfully'),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Carry Bus name cannot be empty'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'MY Buses',
        onBackPressed: () {
          Navigator.of(context).pop();
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Highyes Bus Input Container
              Container(
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: Colors.blue),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Add a Highyes Bus',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: _highyesBusController,
                      decoration: InputDecoration(
                        hintText: 'Enter Highyes Bus Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        prefixIcon: const Icon(Icons.directions_bus, color: Colors.blue),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        onPressed: _addHighyesBus,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: const EdgeInsets.symmetric(
                            vertical: 12.0,
                            horizontal: 24.0,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: const Text('Add Highyes Bus'),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Carry Bus Input Container
              Container(
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Colors.orange[50],
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: Colors.orange),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Add a Carry Bus',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: _carryBusController,
                      decoration: InputDecoration(
                        hintText: 'Enter Carry Bus Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        prefixIcon: const Icon(Icons.local_shipping, color: Colors.orange),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        onPressed: _addCarryBus,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          padding: const EdgeInsets.symmetric(
                            vertical: 12.0,
                            horizontal: 24.0,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: const Text('Add Carry Bus'),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Buses List with Remove Option
              Obx(() {
                final buses = Get.find<MyBusController>().buses;
                if (buses.isEmpty) {
                  return const Center(
                    child: Text(
                      'No buses added yet.',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  );
                }
                return ListView.builder(
                  shrinkWrap: true, // Important to wrap inside SingleChildScrollView
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: buses.length,
                  itemBuilder: (context, index) {
                    final bus = buses[index];
                    return Card(
                      elevation: 3,
                      margin: const EdgeInsets.symmetric(vertical: 6.0),
                      child: ListTile(
                        leading: bus.type == 'Highyes'
                            ? const Icon(Icons.directions_bus, color: Colors.blue)
                            : const Icon(Icons.local_shipping, color: Colors.orange),
                        title: Text(
                          '${bus.type} Bus: ${bus.name}',
                          style: const TextStyle(fontSize: 16),
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            Get.find<MyBusController>().removeBus(bus);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Bus removed successfully'),
                                backgroundColor: Colors.red,
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                );
              }),
              const SizedBox(height: 20),
              // Next Button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(
                    vertical: 14.0,
                    horizontal: 28.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => MyBusSubmit()),
                  );
                },
                child: const Text(
                  'Next',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

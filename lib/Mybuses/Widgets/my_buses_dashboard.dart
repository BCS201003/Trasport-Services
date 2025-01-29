// lib/Mybuses/my_buses.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/Dashboard/dashboard.dart';
import 'package:untitled/Mybuses/Controller/mybus_controller.dart';
import 'package:untitled/Mybuses/Widgets/CourceCard/buses_card.dart';
import 'package:untitled/Mybuses/Widgets/CourceCard/buses_card2.dart';
import 'package:untitled/NavigationSideBar/navigation_sidebar_admin.dart';
import 'package:untitled/Widgets/Appbar/custom_appbar.dart';
import 'package:untitled/Widgets/Expend/expend_container.dart';
import 'package:untitled/Widgets/Expend/expend_container2.dart';

class MyBusSubmit extends StatefulWidget { // Changed to StatefulWidget
  const MyBusSubmit({super.key});

  @override
  State<MyBusSubmit> createState() => _MyBusSubmitState();
}

class _MyBusSubmitState extends State<MyBusSubmit> {
  final MyBusController controller = Get.put(MyBusController());

  // Controllers for input fields
  final TextEditingController _typeController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _sourceController = TextEditingController();
  final TextEditingController _destinationController = TextEditingController();

  @override
  void dispose() {
    _typeController.dispose();
    _nameController.dispose();
    _sourceController.dispose();
    _destinationController.dispose();
    super.dispose();
  }

  // Method to handle adding a bus
  void _handleAddBus() {
    final type = _typeController.text.trim();
    final name = _nameController.text.trim();
    final source = _sourceController.text.trim();
    final destination = _destinationController.text.trim();

    if (type.isNotEmpty && name.isNotEmpty && source.isNotEmpty && destination.isNotEmpty) {
      controller.addBus(
        type: type,
        name: name,
        source: source,
        destination: destination,
      );

      // Clear the input fields
      _typeController.clear();
      _nameController.clear();
      _sourceController.clear();
      _destinationController.clear();

      // Show success message
      Get.snackbar(
        'Success',
        'Bus added successfully',
        backgroundColor: Colors.green,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      // Show error message
      Get.snackbar(
        'Error',
        'All fields are required',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Input Form for Adding a Bus
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      TextField(
                        controller: _typeController,
                        decoration: InputDecoration(
                          labelText: 'Bus Type (Carry/Highyes)',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          prefixIcon: const Icon(Icons.directions_bus),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          labelText: 'Bus Name',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          prefixIcon: const Icon(Icons.drive_eta),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        controller: _sourceController,
                        decoration: InputDecoration(
                          labelText: 'Source',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          prefixIcon: const Icon(Icons.location_on),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        controller: _destinationController,
                        decoration: InputDecoration(
                          labelText: 'Destination',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          prefixIcon: const Icon(Icons.flag),
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: _handleAddBus,
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
                        child: const Text(
                          'Add Bus',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Carry Bus Expandable Container
              ExpandableContainer2(
                title: 'Carry Bus',
                icon: Icons.expand_more,
                expandedContent: Column(
                  children: [
                    const BusCard(),
                    const BusCard2(),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Highyes Bus Expandable Container
              ExpandableContainer2(
                title: 'Highyes Buses',
                icon: Icons.expand_more,
                expandedContent: Column(
                  children: [
                    const BusCard(),
                    const BusCard2(),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Refresh and Next Buttons
              _buildButton(
                label: 'Refresh',
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const MyBusSubmit()),
                  );
                },
              ),
              const SizedBox(height: 10),
              _buildButton(
                label: 'Next',
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const SideBarNavigationAdmin()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build buttons
  Widget _buildButton({required String label, required VoidCallback onPressed}) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 28.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}

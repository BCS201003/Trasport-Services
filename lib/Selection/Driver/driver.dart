import 'package:flutter/material.dart';
import 'package:untitled/NavigationSideBar/navigation_sidebar_driver.dart';
import 'package:untitled/Widgets/Appbar/custom_appbar.dart';
import 'controller_b.dart';

class DriverScreen extends StatefulWidget {
  const DriverScreen({super.key});

  @override
  DriverScreenState createState() => DriverScreenState();
}

class DriverScreenState extends State<DriverScreen> {
  final ControllerB _controllerB = ControllerB();
  String errorMessage = '';

  void _login() {
    if (_controllerB.validateCredentials()) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SideBarNavigationDriver()),
      );
    } else {
      // If credentials are incorrect, display an error
      setState(() {
        errorMessage = 'Your Token ID and Passcode are incorrect';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Driver Token"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Token ID TextField
            TextField(
              controller: _controllerB.tokenController,
              decoration: const InputDecoration(
                labelText: 'Token ID',
                hintText: 'Enter Token ID',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            // Passcode TextField
            TextField(
              controller: _controllerB.passCodeController,
              decoration: const InputDecoration(
                labelText: 'Pas Code',
                hintText: 'Enter Pas Code',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            // Error message display
            if (errorMessage.isNotEmpty)
              Text(
                errorMessage,
                style: const TextStyle(color: Colors.red),
              ),
            const SizedBox(height: 20),
            // Checkbox for accepting terms and conditions
            CheckboxListTile(
              title: const Text("I accept the terms and privacy policy"),
              value: true, // You can implement a checkbox for acceptance if needed
              onChanged: (bool? newValue) {},
              controlAffinity: ListTileControlAffinity.leading,
              activeColor: Colors.black, // Set the checkbox color to black
            ),
            const SizedBox(height: 20),
            // Login button
            ElevatedButton(
              onPressed: _login, // Call the _login function on press
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black, // Background color
                foregroundColor: Colors.white, // Text color
                fixedSize: const Size(200, 50),
              ),
              child: const Text('LOGIN DRIVER'),
            ),
          ],
        ),
      ),
    );
  }
}

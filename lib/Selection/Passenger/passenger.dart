import 'package:flutter/material.dart';
import 'package:untitled/NavigationSideBar/navigation_sidebar_passenger.dart';
import 'package:untitled/Widgets/Appbar/custom_appbar.dart';
import 'controller_c.dart';

class PassengerScreen extends StatefulWidget {
  const PassengerScreen({super.key});

  @override
  PassengerScreenState createState() => PassengerScreenState();
}

class PassengerScreenState extends State<PassengerScreen> {
  final ControllerC _controllerC = ControllerC();
  String errorMessage = '';

  void _login() {
    if (_controllerC.validateCredentials()) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SideBarNavigationPassenger()),
      );
    } else {
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
            TextField(
              controller: _controllerC.tokenController,
              decoration: const InputDecoration(
                labelText: 'Token ID',
                hintText: 'Enter Token ID',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _controllerC.passCodeController,
              decoration: const InputDecoration(
                labelText: 'Pas Code',
                hintText: 'Enter Pas Code',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            if (errorMessage.isNotEmpty)
              Text(
                errorMessage,
                style: const TextStyle(color: Colors.red),
              ),
            const SizedBox(height: 20),
            CheckboxListTile(
              title: const Text("I accept the terms and privacy policy"),
              value: true,
              onChanged: (bool? newValue) {},
              controlAffinity: ListTileControlAffinity.leading,
              activeColor: Colors.black,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
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
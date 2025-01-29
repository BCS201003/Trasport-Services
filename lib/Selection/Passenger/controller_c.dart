import 'package:flutter/material.dart';

class ControllerC {

  final TextEditingController tokenController = TextEditingController();
  final TextEditingController passCodeController = TextEditingController();

  final List<Map<String, String>> validCredentials = [
    {'tokenId': '123', 'passCode': '123'},
    {'tokenId': '1237', 'passCode': '1234567'},
    {'tokenId': 'ABCD', 'passCode': '12345611'},
    {'tokenId': '1332', 'passCode': '123456124'},
  ];

  bool validateCredentials() {
    for (var credential in validCredentials) {
      if (tokenController.text == credential['tokenId'] &&
          passCodeController.text == credential['passCode']) {
        return true;
      }
    }
    return false;
  }

  void clearControllers() {
    tokenController.clear();
    passCodeController.clear();
  }
}

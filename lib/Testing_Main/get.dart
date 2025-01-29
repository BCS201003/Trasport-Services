import 'dart:convert' as convert;
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

// void main(List<String> arguments) async {
//   await fetchBooks();
// }

Future<void> fetchBooks() async {
  var url = Uri.https('www.googleapis.com', '/books/v1/volumes', {'q': '{http}'});

  var response = await http.get(url);
  if (response.statusCode == 200) {
    var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;
    var itemCount = jsonResponse['totalItems'];
    if (kDebugMode) {
      print('Number of books about http: $itemCount.');
    }
  } else {
    if (kDebugMode) {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}

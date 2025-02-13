import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert'; // Add this line
import 'package:http/http.dart' as http;

class PostApiScreen extends StatefulWidget {
  const PostApiScreen({super.key});

  @override
  PostApiScreenState createState() => PostApiScreenState();
}

class PostApiScreenState extends State<PostApiScreen> {
  bool isLoading = false;
  String result = '';

  @override
  void initState() {
    super.initState();
    postApi();
  }

  Future<void> postApi() async {
    setState(() {
      isLoading = true;
    });

    Uri uri = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    Map<String, dynamic> body = {
      'title': 'First Post',
      'body': 'This is my first Post',
      'userId': '1',
    };

    final response = await http.post(
      uri,
      body: json.encode(body),
      headers: {'Content-Type': 'application/json'},
    );

    setState(() {
      isLoading = false;
      if (response.statusCode == 201) {
        result = 'Post created successfully: ${response.body}';
      } else {
        result = 'Failed to create post: ${response.statusCode}';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post API Example'),
      ),
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(result, textAlign: TextAlign.center),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:untitled/Feedback/Widget/lesson/rule.dart';
import 'package:untitled/Feedback/Widget/lesson/rule2.dart';
import 'package:untitled/Feedback/Widget/outputwidget.dart';
import 'package:untitled/Widgets/Appbar/custom_appbar.dart';

class FeedbackScreen extends StatelessWidget {
  const FeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: 'Feedback',
        onBackPressed: () {
          Navigator.of(context).pop();
        },
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutputWidget(),
              Feedback1Widget(),
              Feedback2Widget(),
            ],
          ),
        ),
      ),
    );
  }
}
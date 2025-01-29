import 'package:flutter/material.dart';
import 'package:untitled/Dashboard/Widgets/wg.dart';
import 'package:untitled/Dashboard/Widgets/wg1.dart';
import 'package:untitled/Dashboard/Widgets/wg2.dart';
import 'package:untitled/Widgets/Appbar/custom_appbar.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: 'MY Buses Dashboard',
        onBackPressed: () {
          Navigator.of(context).pop();
        },
      ),
      body:const Scrollbar(
        child: SingleChildScrollView(
          child: Column(
            children: [
              DashboardWG(title1: 'G-5, G-6'),
              DashboardWG1(title1: 'G-8 --- G-11'),
              DashboardWG2(title1: 'G-12 --- G-14'),
              DashboardWG(title1: 'I-8'),
              DashboardWG2(title1: 'I-9 --- I-11 '),
              DashboardWG1(title1: 'I-12 to I-16:'),
            ],
          ),
        ),
      ),
    );
  }
}
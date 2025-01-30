import 'package:flutter/material.dart';
import 'package:untitled/Advertiz/Widget/follow_rules.dart';
import 'package:untitled/Advertiz/Widget/occ.dart';
import 'package:untitled/Advertiz/Widget/outcome.dart';
import 'package:untitled/Widgets/Appbar/custom_appbar.dart';

class Advertiz extends StatefulWidget {
  const Advertiz({super.key});

  @override
  State<Advertiz> createState() => AdvertizState();
}

class AdvertizState extends State<Advertiz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Bus Advertise',
        onBackPressed: () {
          Navigator.of(context).pop();
        },
      ),
      backgroundColor: Colors.white,
      body: const Center(
        child: Scrollbar(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OCC(),
                ADVERTIZWidget(),
                FollowRules(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
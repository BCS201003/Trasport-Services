import 'package:flutter/material.dart';

class ADVERTIZWidget extends StatelessWidget {
  const ADVERTIZWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Cust University Bus ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Jost',
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      height: 17.0 / 12.0,
                    ),
                  ),
                Text(
                  'Advertising  ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Jost',
                    fontSize: 12,
                    fontWeight: FontWeight.bold, // Correct assignment
                    color: Colors.black,
                    height: 17.0 / 12.0, // Correct height calculation
                  ),
                  ),
            Text(
              'Video Duration: 1 Min 52 Sec',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Jost',
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                height: 17.0 / 12.0,
              ),
            ),
              ],
              ),
            ),
          SizedBox(height: 10),
          //VideoDisplayWidget(),
        ],
      ),
    );
  }
}

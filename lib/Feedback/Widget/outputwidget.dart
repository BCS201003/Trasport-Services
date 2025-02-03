import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class OutputWidget extends StatefulWidget {
  const OutputWidget({super.key});

  @override
  OutputWidgetState createState() => OutputWidgetState();
}

class OutputWidgetState extends State<OutputWidget> {
  bool _showFeedback = false;

  final TextEditingController _feedbackController = TextEditingController();

  @override
  void dispose() {
    _feedbackController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final verticalSpaceSmall = screenHeight * 0.01; // ~1% of height
    final verticalSpaceMed = screenHeight * 0.02; // ~2% of height
    final verticalSpaceLarge = screenHeight * 0.03; // ~3% of height

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Total Feedback',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Jost',
            fontSize: screenWidth * 0.05, // 5% of width
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: verticalSpaceMed),
        Card(
          elevation: 4,
          margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(screenWidth * 0.03),
          ),
          child: Padding(
            padding: EdgeInsets.all(screenWidth * 0.04),
            child: TweenAnimationBuilder<Color?>(
              tween: ColorTween(
                begin: const Color.fromARGB(215, 66, 120, 143),
                end: const Color.fromARGB(215, 66, 120, 143),
              ),
              duration: const Duration(seconds: 2),
              builder: (context, color, child) {
                return CircularPercentIndicator(
                  radius: (screenWidth < screenHeight
                          ? screenWidth
                          : screenHeight) *
                      0.25,
                  lineWidth: screenWidth * 0.05,
                  animation: true,
                  animationDuration: 1200,
                  percent: 0.6,
                  circularStrokeCap: CircularStrokeCap.round,
                  progressColor: color,
                  backgroundColor: Colors.grey.withOpacity(0.2),
                  center: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "60%",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Jost',
                          fontSize: screenWidth * 0.08,
                          color: Colors.black87,
                        ),
                      ),
                      Text(
                        "Available",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Jost',
                          fontSize: screenWidth * 0.035,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
        SizedBox(height: verticalSpaceMed),
        Padding(
          padding: EdgeInsets.only(left: screenWidth * 0.04),
          child: Text(
            'Feedback Is Important',
            style: TextStyle(
              fontFamily: 'Jost',
              fontSize: screenWidth * 0.04,
              color: Colors.grey,
            ),
          ),
        ),
        SizedBox(height: verticalSpaceLarge),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
          child: ElevatedButton.icon(
            icon: Icon(
              Icons.feedback_outlined,
              color: Colors.white,
              size: screenWidth * 0.05,
            ),
            label: Text(
              _showFeedback ? "Close Feedback" : "Share Feedback",
              style:
                  TextStyle(fontFamily: 'Jost', fontSize: screenWidth * 0.04),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 66, 120, 143),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(screenWidth * 0.04),
              ),
              padding: EdgeInsets.symmetric(
                vertical: screenHeight * 0.018,
                horizontal: screenWidth * 0.03,
              ),
            ),
            onPressed: () {
              setState(() {
                _showFeedback = !_showFeedback;
              });
            },
          ),
        ),
        if (_showFeedback)
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: verticalSpaceMed,
              horizontal: screenWidth * 0.04,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: EdgeInsets.all(screenWidth * 0.04),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.blue[100]!, Colors.blue[50]!],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(screenWidth * 0.03),
                  ),
                  child: Text(
                    'Your feedback is valuable. Please share your thoughts!',
                    style: TextStyle(
                      fontFamily: 'Jost',
                      fontSize: screenWidth * 0.04,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: verticalSpaceMed),
                TextField(
                  controller: _feedbackController,
                  decoration: InputDecoration(
                    labelText: 'Your Feedback',
                    labelStyle: TextStyle(
                        fontFamily: 'Jost', fontSize: screenWidth * 0.04),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(screenWidth * 0.03),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: screenHeight * 0.02,
                      horizontal: screenWidth * 0.03,
                    ),
                  ),
                  maxLines: 3,
                ),
                SizedBox(height: verticalSpaceMed),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange[700],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(screenWidth * 0.04),
                    ),
                    padding:
                        EdgeInsets.symmetric(vertical: screenHeight * 0.018),
                  ),
                  onPressed: () {
                    if (_feedbackController.text.trim().isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Please enter some feedback.',
                            style: TextStyle(fontSize: screenWidth * 0.035),
                          ),
                        ),
                      );
                    } else {
                      // Close feedback section
                      setState(() {
                        _showFeedback = false;
                      });
                      // Clear the text field
                      _feedbackController.clear();
                      // Show success message
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Your feedback was successfully generated.',
                            style: TextStyle(fontSize: screenWidth * 0.035),
                          ),
                        ),
                      );
                    }
                  },
                  child: Text(
                    "Submit Feedback",
                    style: TextStyle(
                        fontFamily: 'Jost', fontSize: screenWidth * 0.04),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}

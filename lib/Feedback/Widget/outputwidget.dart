import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class OutputWidget extends StatefulWidget {
  const OutputWidget({super.key});
  @override
  OutputWidgetState createState() => OutputWidgetState();
}

class OutputWidgetState extends State<OutputWidget> {
  bool _showFeedback = false;

  // Controller to capture the feedback text
  final TextEditingController _feedbackController = TextEditingController();

  @override
  void dispose() {
    // Dispose of the controller when the widget is removed from the widget tree
    _feedbackController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        const Text(
          'Total Feedback',
          style: TextStyle(
            fontFamily: 'Jost',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 16),
        Center(
          child: TweenAnimationBuilder<Color?>(
            tween: ColorTween(
              begin: const Color.fromARGB(215, 66, 120, 143),
              end: const Color.fromARGB(215, 66, 120, 143),
            ),
            duration: const Duration(seconds: 2),
            builder: (context, color, child) {
              return CircularPercentIndicator(
                radius: screenWidth * 0.245,
                lineWidth: screenWidth * 0.062,
                animation: true,
                percent: 0.6,
                center: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "60%",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Jost',
                        fontSize: screenWidth * 0.08,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "Available",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Jost',
                        fontSize: screenWidth * 0.03,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                circularStrokeCap: CircularStrokeCap.round,
                progressColor: color,
                backgroundColor: Colors.grey.withOpacity(0.4),
              );
            },
          ),
        ),
        const Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Text(
              'Feedback Is Important',
              style: TextStyle(
                fontFamily: 'Jost',
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _showFeedback = !_showFeedback;
            });
          },
          child: const Text("Feedback"),
        ),

        // The feedback section is shown/hidden based on _showFeedback
        Visibility(
          visible: _showFeedback,
          child: Column(
            children: [
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(16),
                color: Colors.blue[100],
                child: const Text(
                  'Your feedback is valuable. Please share your thoughts!',
                  style: TextStyle(
                    fontFamily: 'Jost',
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _feedbackController,
                decoration: const InputDecoration(
                  labelText: 'Your Feedback',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // You can add validation or API calls here if needed
                  if (_feedbackController.text.trim().isEmpty) {
                    // Example: Show a SnackBar if text is empty
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please enter some feedback.'),
                      ),
                    );
                  } else {
                    // Close feedback section
                    setState(() {
                      _showFeedback = false;
                    });
                    // Clear the text field
                    _feedbackController.clear();

                    // Show success message (SnackBar)
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Your feedback was successfully generated.'),
                      ),
                    );
                  }
                },
                child: const Text("Submit Feedback"),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

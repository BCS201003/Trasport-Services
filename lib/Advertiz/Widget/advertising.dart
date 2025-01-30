import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // Ensure this is added in pubspec.yaml

class ADVERTIZWidget extends StatefulWidget {
  const ADVERTIZWidget({super.key});

  @override
  _ADVERTIZWidgetState createState() => _ADVERTIZWidgetState();
}

class _ADVERTIZWidgetState extends State<ADVERTIZWidget> {
  late VideoPlayerController _controller;
  bool _isPlaying = false;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    // Initialize the VideoPlayerController with the asset video
    _controller = VideoPlayerController.asset('assets/Certified.mp4')
      ..initialize().then((_) {
        setState(() {
          _isInitialized = true;
        });
      });

    // Listen for video state changes
    _controller.addListener(() {
      setState(() {
        _isPlaying = _controller.value.isPlaying;
      });
    });
  }

  @override
  void dispose() {
    // Dispose the controller to free resources
    _controller.dispose();
    super.dispose();
  }

  // Toggle play/pause
  void _togglePlayPause() {
    setState(() {
      _isPlaying ? _controller.pause() : _controller.play();
    });
  }

  @override
  Widget build(BuildContext context) {
    // Fetch screen dimensions for responsive design
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Define responsive sizes
    final containerWidth = screenWidth * 0.94;
    final containerPadding = screenWidth * 0.05;
    final titleFontSize = screenWidth * 0.04; // Adjust font size based on screen width
    final durationFontSize = screenWidth * 0.035;
    final spacing = screenHeight * 0.02;

    return Center(
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        shadowColor: Colors.black38,
        color: Colors.white,
        child: Container(
          width: containerWidth,
          padding: EdgeInsets.all(containerPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // "Cust University Bus" Text
                  Flexible(
                    child: Text(
                      'Cust University Bus',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Jost',
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        height: 1.42, // Equivalent to height: 17/12
                      ),
                    ),
                  ),
                  // "Advertising" Text
                  Flexible(
                    child: Text(
                      'Advertising',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Jost',
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        height: 1.42,
                      ),
                    ),
                  ),
                  // "Video Duration" Text
                  Flexible(
                    child: Text(
                      'Video Duration: 1 Min 52 Sec',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Jost',
                        fontSize: durationFontSize,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        height: 1.42,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: spacing),

              // Video Display with Play/Pause Overlay
              Container(
                width: double.infinity,
                height: screenHeight * 0.25, // Responsive height
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.black12, // Placeholder background color
                  // If the video is initialized, show the video, else show a placeholder
                ),
                child: _isInitialized
                    ? Stack(
                  children: [
                    // Video Player
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: VideoPlayer(_controller),
                    ),
                    // Overlay for Play/Pause button
                    GestureDetector(
                      onTap: _togglePlayPause,
                      child: Container(
                        color: Colors.black38, // Semi-transparent overlay
                        child: Center(
                          child: Icon(
                            _isPlaying
                                ? Icons.pause_circle_filled
                                : Icons.play_circle_fill,
                            color: Colors.amber.shade700,
                            size: screenWidth * 0.1, // Responsive size
                          ),
                        ),
                      ),
                    ),
                  ],
                )
                    : Center(
                  child: CircularProgressIndicator(
                    color: Colors.amber.shade700,
                  ),
                ),
              ),
              SizedBox(height: spacing),

              // Gradient Divider
              Container(
                width: double.infinity,
                height: 2,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black,
                      Colors.amber.shade700,
                      Colors.black,
                    ],
                  ),
                ),
              ),
              SizedBox(height: spacing),

              // Optional: Additional Information or Actions
              // Example: Buttons or descriptive texts
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Example Button: Learn More
                  ElevatedButton.icon(
                    onPressed: () {
                      // Implement your action here
                    },
                    icon: Icon(
                      Icons.info_outline,
                      color: Colors.white,
                      size: screenWidth * 0.04,
                    ),
                    label: Text(
                      'Learn More',
                      style: TextStyle(
                        fontFamily: 'Jost',
                        fontSize: screenWidth * 0.035,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber.shade700, // Accent color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.04,
                        vertical: screenHeight * 0.015,
                      ),
                    ),
                  ),
                  // Example IconButton: Share
                  IconButton(
                    onPressed: () {
                      // Implement your share functionality here
                    },
                    icon: const Icon(
                      FontAwesomeIcons.shareAlt,
                      color: Colors.amber,
                    ),
                    iconSize: screenWidth * 0.06,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

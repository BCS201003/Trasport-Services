// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
//
// class VideoDisplayWidget extends StatefulWidget {
//   const VideoDisplayWidget({super.key});
//
//   @override
//   _VideoDisplayWidgetState createState() => _VideoDisplayWidgetState();
// }
//
// class _VideoDisplayWidgetState extends State<VideoDisplayWidget> {
//   late VideoPlayerController _videoController;
//   bool _showControls = false;
//   Timer? _hideControlsTimer;
//
//   @override
//   void initState() {
//     super.initState();
//     _initializeVideo();
//   }
//
//   void _initializeVideo() {
//     _videoController = VideoPlayerController.asset('assets/video.mp4')
//       ..initialize().then((_) {
//         setState(() {});
//         _videoController.setLooping(true); // Optional: Loop the video
//         _videoController.play();
//       });
//   }
//
//   void _togglePlayPause() {
//     setState(() {
//       if (_videoController.value.isPlaying) {
//         _videoController.pause();
//       } else {
//         _videoController.play();
//       }
//     });
//     _resetControlsTimer();
//   }
//
//   void _rewind() {
//     final currentPosition = _videoController.value.position;
//     _videoController.seekTo(
//       currentPosition - const Duration(seconds: 10), // Rewind 10 seconds
//     );
//     _resetControlsTimer();
//   }
//
//   void _forward() {
//     final currentPosition = _videoController.value.position;
//     _videoController.seekTo(
//       currentPosition + const Duration(seconds: 10), // Forward 10 seconds
//     );
//     _resetControlsTimer();
//   }
//
//   void _toggleControlsVisibility() {
//     setState(() {
//       _showControls = !_showControls;
//     });
//
//     if (_showControls) {
//       _resetControlsTimer();
//     } else {
//       _hideControlsTimer?.cancel();
//     }
//   }
//
//   void _resetControlsTimer() {
//     _hideControlsTimer?.cancel();
//     _hideControlsTimer = Timer(const Duration(seconds: 3), () {
//       setState(() {
//         _showControls = false;
//       });
//     });
//   }
//
//   @override
//   void dispose() {
//     _videoController.dispose();
//     _hideControlsTimer?.cancel();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: _toggleControlsVisibility,
//       child: Stack(
//         alignment: Alignment.center,
//         children: [
//           // Zoomable Video Player
//           _videoController.value.isInitialized
//               ? InteractiveViewer(
//             panEnabled: true,
//             minScale: 1.0,
//             maxScale: 3.0, // Maximum zoom level
//             child: AspectRatio(
//               aspectRatio: _videoController.value.aspectRatio,
//               child: VideoPlayer(_videoController),
//             ),
//           )
//               : const CircularProgressIndicator(),
//
//           // Controls Overlay
//           if (_showControls)
//             Container(
//               color: Colors.black.withOpacity(0.5),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   // Play/Pause Button
//                   IconButton(
//                     iconSize: 64,
//                     color: Colors.white,
//                     icon: Icon(
//                       _videoController.value.isPlaying
//                           ? Icons.pause
//                           : Icons.play_arrow,
//                     ),
//                     onPressed: _togglePlayPause,
//                   ),
//                   const SizedBox(height: 16),
//
//                   // Playback Controls
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       IconButton(
//                         onPressed: _rewind,
//                         icon: const Icon(Icons.replay_10),
//                         color: Colors.white,
//                         tooltip: "Rewind 10 seconds",
//                       ),
//                       IconButton(
//                         onPressed: _forward,
//                         icon: const Icon(Icons.forward_10),
//                         color: Colors.white,
//                         tooltip: "Forward 10 seconds",
//                       ),
//                     ],
//                   ),
//
//                   // Video Progress Bar
//                   if (_videoController.value.isInitialized)
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 16),
//                       child: Column(
//                         children: [
//                           Slider(
//                             value:
//                             _videoController.value.position.inSeconds.toDouble(),
//                             min: 0,
//                             max: _videoController.value.duration.inSeconds.toDouble(),
//                             onChanged: (value) {
//                               setState(() {
//                                 _videoController.seekTo(
//                                   Duration(seconds: value.toInt()),
//                                 );
//                               });
//                               _resetControlsTimer();
//                             },
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 _formatDuration(
//                                     _videoController.value.position),
//                                 style: const TextStyle(
//                                   fontSize: 12,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                               Text(
//                                 _formatDuration(
//                                     _videoController.value.duration),
//                                 style: const TextStyle(
//                                   fontSize: 12,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                 ],
//               ),
//             ),
//         ],
//       ),
//     );
//   }
//
//   String _formatDuration(Duration position) {
//     final minutes = position.inMinutes;
//     final seconds = position.inSeconds % 60;
//     return '$minutes:${seconds.toString().padLeft(2, '0')}';
//   }
// }
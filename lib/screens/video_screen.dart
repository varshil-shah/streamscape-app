import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:streamscape/widgets/circular_avatar.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  final resolutions = {
    "360p":
        "https://s3.ap-south-1.amazonaws.com/final-videos.video-transcoding-service/videos/hitesh/360P/index.m3u8",
    "480p":
        "https://s3.ap-south-1.amazonaws.com/final-videos.video-transcoding-service/videos/hitesh/480P/index.m3u8",
    "720p":
        "https://s3.ap-south-1.amazonaws.com/final-videos.video-transcoding-service/videos/hitesh/720P/index.m3u8",
    "1080p":
        "https://s3.ap-south-1.amazonaws.com/final-videos.video-transcoding-service/videos/hitesh/1080P/index.m3u8",
    "auto":
        "https://s3.ap-south-1.amazonaws.com/final-videos.video-transcoding-service/videos/hitesh/playlist.m3u8"
  };
  final String title = "Learn how React works internally with Hitesh Choudhary";

  final String videoDescription =
      "This is a detailed video explaining the internal workings of React. In this video, Hitesh Choudhary goes through the fiber architecture, component lifecycle, and hooks. "
      "You'll learn how reconciliation works in React, and how it helps in efficient UI rendering. The video covers practical examples, which will help you solidify your understanding of these concepts. "
      "This is an essential watch for anyone looking to go deeper into React's internals and optimize their applications effectively.";

  @override
  Widget build(BuildContext context) {
    final betterPlayerDataSource = BetterPlayerDataSource(
      BetterPlayerDataSourceType.network,
      resolutions['1080p']!, // Default resolution
      resolutions: resolutions, // Pass the resolutions map here
    );

    final betterPlayerController = BetterPlayerController(
      const BetterPlayerConfiguration(
        aspectRatio: 16 / 9,
        autoPlay: false, // change later
        looping: false,
        autoDetectFullscreenAspectRatio: true,
        controlsConfiguration: BetterPlayerControlsConfiguration(
          enableSubtitles: true,
          enablePlaybackSpeed: true,
          enableQualities: true, // Enables the quality selection UI
        ),
      ),
      betterPlayerDataSource: betterPlayerDataSource,
    );

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: BetterPlayer(controller: betterPlayerController),
                ),
                const SizedBox(height: 10),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Row(
                  children: [
                    CircularAvatar(displayName: "Hitesh Choudhary"),
                    SizedBox(width: 10),
                    Text(
                      "Hitesh Choudhary",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "10K views",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Divider(),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    videoDescription,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

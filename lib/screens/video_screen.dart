import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:streamscape/constants.dart';
import 'package:streamscape/widgets/circular_avatar.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen>
    with TickerProviderStateMixin {
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

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final betterPlayerDataSource = BetterPlayerDataSource(
      BetterPlayerDataSourceType.network,
      resolutions['auto']!,
      resolutions: resolutions,
    );

    final betterPlayerController = BetterPlayerController(
      const BetterPlayerConfiguration(
        aspectRatio: 16 / 9,
        autoPlay: false,
        looping: false,
        autoDetectFullscreenAspectRatio: true,
        autoDetectFullscreenDeviceOrientation: true,
        controlsConfiguration: BetterPlayerControlsConfiguration(
          enableSubtitles: true,
          enablePlaybackSpeed: true,
          enableQualities: true,
        ),
      ),
      betterPlayerDataSource: betterPlayerDataSource,
    );

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 4.0),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: BetterPlayer(controller: betterPlayerController),
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 4.0),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 5),
            const Padding(
              padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 4.0),
              child: Row(
                children: [
                  CircularAvatar(displayName: "Hitesh Choudhary"),
                  SizedBox(width: 10),
                  Text(
                    "Hitesh Choudhary",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "20K views",
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            const Divider(),
            TabBar(
              controller: _tabController,
              indicatorColor: primaryColor,
              labelColor: primaryColor,
              unselectedLabelColor: Colors.grey,
              tabs: const [
                Tab(
                  child: Text(
                    "Description",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    "AI Summary",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SingleChildScrollView(
                      child: Text(
                        videoDescription,
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: SingleChildScrollView(
                      child: Text(
                        "AI Summary will be available soon",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

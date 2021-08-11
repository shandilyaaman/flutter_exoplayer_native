import 'package:flutter/material.dart';

import 'video_player.dart';
import 'video_play_pause_widget.dart';

class AspectRatioVideo extends StatefulWidget {
  AspectRatioVideo(this.controller);

  final VideoPlayerController controller;

  @override
  AspectRatioVideoState createState() => AspectRatioVideoState();
}

class AspectRatioVideoState extends State<AspectRatioVideo> {
  VideoPlayerController get controller => widget.controller;
  bool initialized = false;

  VoidCallback listener;

  @override
  void initState() {
    super.initState();
    listener = () {
      if (!mounted) {
        return;
      }
      if (initialized != controller.value.initialized) {
        initialized = controller.value.initialized;
        setState(() {});
      }
    };
    controller.addListener(listener);
  }

  @override
  Widget build(BuildContext context) {
    if (initialized) {
      return AspectRatio(
        aspectRatio: controller.value.aspectRatio > 0.0
            ? controller.value.aspectRatio
            : 16 / 9,
        child: Center(
          child: VideoPlayPause(controller),
        ),
      );
    } else {
      return Container(
        child: Center(
          child: Text(
            "loading media...",
            style: TextStyle(color: Colors.red, fontSize: 15),
          ),
        ),
      );
    }
  }
}

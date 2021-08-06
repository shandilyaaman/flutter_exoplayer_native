import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'video_player.dart';
import 'fade_animation_widget.dart';

/// Controls play and pause of [controller].
///
/// Toggles play/pause on tap (accompanied by a fading status icon).
///
/// Plays (looping) on initialization, and mutes on deactivation.
class VideoPlayPause extends StatefulWidget {
  VideoPlayPause(this.controller);

  final VideoPlayerController controller;

  @override
  State createState() {
    return _VideoPlayPauseState();
  }
}

class _VideoPlayPauseState extends State<VideoPlayPause> {
  _VideoPlayPauseState() {
    listener = () {
      SchedulerBinding.instance.addPostFrameCallback((_) => setState(() {}));
    };
  }

  FadeAnimation imageFadeAnim =
  FadeAnimation(child: const Icon(Icons.play_arrow, size: 100.0, color: Colors.white,));
  VoidCallback listener;

  VideoPlayerController get controller => widget.controller;

  @override
  void initState() {
    super.initState();
    controller.addListener(listener);
    controller.setVolume(1.0);
    controller.play();
  }

  @override
  void deactivate() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      controller.setVolume(0.0);
      controller.removeListener(listener);
    });

    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = <Widget>[
      GestureDetector(
        child: VideoPlayer(controller),
        onTap: () {
          if(controller.value.hasError) {
            Text(controller.value.toString(), style: TextStyle(color: Colors.red, fontSize: 16),);
          }
          if (!controller.value.initialized) {
            return;
          }
          if (controller.value.isPlaying) {
            imageFadeAnim =
                FadeAnimation(child: const Icon(Icons.pause, size: 100.0, color: Colors.white));
            controller.pause();
          } else {
            controller.play();
            imageFadeAnim =
                FadeAnimation(child: const Icon(Icons.play_arrow, size: 100.0, color: Colors.white));
          }
        },
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: VideoProgressIndicator(
          controller,
          allowScrubbing: true,
          colors: VideoProgressColors(playedColor: Colors.red, backgroundColor: Colors.grey, bufferedColor: Colors.white),
        ),
      ),
      Center(child: imageFadeAnim),
    ];

    return Stack(
      fit: StackFit.passthrough,
      children: children,
    );
  }
}
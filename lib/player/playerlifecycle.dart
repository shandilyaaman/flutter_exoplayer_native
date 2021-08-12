import 'package:flutter/material.dart';

import 'video_player.dart';

abstract class PlayerLifeCycle extends StatefulWidget {
  PlayerLifeCycle(
      this.dataSource, this.licenseUrl, this.extension, this.childBuilder);

  final VideoWidgetBuilder childBuilder;
  final String dataSource;
  final String licenseUrl;
  final String extension;
}

typedef Widget VideoWidgetBuilder(
    BuildContext context, VideoPlayerController controller);

/// A widget connecting its life cycle to a [VideoPlayerController] using
/// a data source from the network.
class NetworkPlayerLifeCycle extends PlayerLifeCycle {
  NetworkPlayerLifeCycle(String dataSource, String licenseUrl, String extension,
      VideoWidgetBuilder childBuilder)
      : super(dataSource, licenseUrl, extension, childBuilder);

  @override
  _NetworkPlayerLifeCycleState createState() => _NetworkPlayerLifeCycleState();
}

class _NetworkPlayerLifeCycleState extends _PlayerLifeCycleState {
  @override
  VideoPlayerController createVideoPlayerController() {
    var formatHint;
    if (widget.extension != null && widget.extension.isNotEmpty) {
      if (widget.extension == 'mpd') {
        formatHint = VideoFormat.dash;
      }
    }
    return VideoPlayerController.network(widget.dataSource,
        formatHint: formatHint, licenseUrl: widget.licenseUrl);
  }
}

abstract class _PlayerLifeCycleState extends State<PlayerLifeCycle> {
  VideoPlayerController controller;

  @override

  /// Subclasses should implement [createVideoPlayerController], which is used
  /// by this method.
  void initState() {
    super.initState();
    controller = createVideoPlayerController();
    controller.addListener(() {
      if (controller.value.hasError) {
        print(controller.value.errorDescription);
      }
    });
    controller.initialize();
    controller.setLooping(true);
    controller.play();
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.childBuilder(context, controller);
  }

  VideoPlayerController createVideoPlayerController();
}

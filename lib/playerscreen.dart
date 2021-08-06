import 'package:flutter/material.dart';
import 'package:flutter_app_native/main.dart';
import 'package:flutter_app_native/player/video_player.dart';

import 'model/MediaItemModel.dart';
import 'player/playerlifecycle.dart';
import 'player/videowidget.dart';

class PlayerScreen extends StatefulWidget {
  final MediaItemModel _model;

  const PlayerScreen(this._model);

  @override
  State<StatefulWidget> createState() {
    return _PlayerScreenState(_model);
  }
}

class _PlayerScreenState extends State<PlayerScreen> {
  final MediaItemModel _model;

  _PlayerScreenState(this._model);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Media Play"),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.topCenter,
                child: NetworkPlayerLifeCycle(
                  _model.url,
                  _model.drmLicenseUrl,
                  (BuildContext context, VideoPlayerController controller) =>
                      AspectRatioVideo(controller),
                ),
              ),
            ),
            Text(
              "Playing url: " + _model.url,
              style: TextStyle(color: Colors.blue, fontSize: 22),
            ),
          ],
        ),
      ),
    );
  }
}

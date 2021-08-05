import 'package:flutter/material.dart';
import 'package:flutter_app_native/main.dart';
import 'package:flutter_app_native/player/video_player.dart';

import 'player/playerlifecycle.dart';
import 'player/videowidget.dart';

class PlayerScreen extends StatefulWidget {
  final String _url;
  final String _drmLicense;

  const PlayerScreen(this._url, this._drmLicense);

  @override
  State<StatefulWidget> createState() {
    return _PlayerScreenState(_url, _drmLicense);
  }
}

class _PlayerScreenState extends State<PlayerScreen> {
  final String _url;
  final String _drmLicense;

  _PlayerScreenState(this._url, this._drmLicense);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Media Play"),
      ),
      body: Container(
        child: Column(
          children: [
            Text(
              "Playing url: $_url",
              style: TextStyle(color: Colors.blue, fontSize: 22),
            ),
            Container(
              child: NetworkPlayerLifeCycle(
                _url,
                _drmLicense,
                (BuildContext context, VideoPlayerController controller) =>
                    AspectRatioVideo(controller),
              ),
            )
          ],
        ),
      ),
    );
  }
}

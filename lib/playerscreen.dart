import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_native/player/video_player.dart';

import 'model/Samples.dart';
import 'player/playerlifecycle.dart';
import 'player/videowidget.dart';

class PlayerScreen extends StatefulWidget {
  final Sample _model;

  const PlayerScreen(this._model);

  @override
  State<StatefulWidget> createState() {
    return _PlayerScreenState(_model);
  }
}

class _PlayerScreenState extends State<PlayerScreen> {
  final Sample _model;

  _PlayerScreenState(this._model);

  Future _hideNavigationBar() async {
    SystemChrome.setEnabledSystemUIOverlays([]);
  }

  Future _showNavigationBar() async {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
  }

  @override
  void deactivate() {
    _showNavigationBar();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).orientation != Orientation.portrait) {
      _hideNavigationBar();
    } else {
      _showNavigationBar();
    }
    return OrientationBuilder(builder: (context, orientation) {
      if (orientation == Orientation.portrait) {
        return _setPortrait();
      } else {
        return _setLandscape();
      }
    });
  }

  Widget _setLandscape() {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: NetworkPlayerLifeCycle(
          _model.uri,
          _model.drm_license_uri,
          _model.extension,
          (BuildContext context, VideoPlayerController controller) =>
              AspectRatioVideo(controller),
        ),
      ),
    );
  }

  Widget _setPortrait() {
    return Scaffold(
      appBar: AppBar(
        title: Text("Media Play"),
      ),
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: NetworkPlayerLifeCycle(
              _model.uri,
              _model.drm_license_uri,
              _model.extension,
              (BuildContext context, VideoPlayerController controller) =>
                  AspectRatioVideo(controller),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _model.name,
                  style: TextStyle(color: Colors.black, fontSize: 22),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                  child: Text(
                    _model.uri,
                    style: TextStyle(color: Colors.black38, fontSize: 14),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                  child: _model.drm_license_uri != null
                      ? Text(
                          "With DRM",
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 14,
                              backgroundColor: Colors.green),
                        )
                      : Text(
                          "Without DRM",
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 14,
                            backgroundColor: Colors.red,
                          ),
                        ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

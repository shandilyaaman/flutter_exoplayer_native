import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_native/model/MediaItemModel.dart';
import 'package:flutter_app_native/playerscreen.dart';

class ListMediaScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MediaListState();
  }
}

class _MediaListState extends State<ListMediaScreen> {
  List<MediaItemModel> _mediaList = List.empty(growable: true);

  void _createMediaList() {
    var model1 = MediaItemModel(
        "Widevine DASH (MP4, H264)",
        "https://storage.googleapis.com/wvmedia/cenc/h264/tears/tears.mpd",
        "https://proxy.uat.widevine.com/proxy?video_id=d286538032258a1c&provider=widevine_test");
    var model2 = MediaItemModel(
        "SD (WebM, Clear)",
        "https://storage.googleapis.com/wvmedia/2019/clear/av1/24/webm/llama_av1_480p_400.webm",
        "");
    var model3 = MediaItemModel(
        "Clear DASH",
        "https://storage.googleapis.com/wvmedia/clear/h264/tears/tears.mpd",
        "");
    var model4 = MediaItemModel(
        "Widevine DASH (WebM, VP9)",
        "https://storage.googleapis.com/wvmedia/cenc/vp9/tears/tears.mpd",
        "https://proxy.uat.widevine.com/proxy?provider=widevine_test");
    var model5 = MediaItemModel(
        "Widevine DASH (MP4, H265)",
        "https://storage.googleapis.com/wvmedia/cenc/hevc/tears/tears.mpd",
        "https://proxy.uat.widevine.com/proxy?provider=widevine_test");
    var model6 = MediaItemModel(
        "Widevine DASH (policy tests)",
        "https://storage.googleapis.com/wvmedia/cenc/h264/tears/tears.mpd",
        "https://proxy.uat.widevine.com/proxy?video_id=GTS_SW_SECURE_CRYPTO&provider=widevine_test");
    var model7 = MediaItemModel(
        "60fps DASH",
        "https://storage.googleapis.com/exoplayer-test-media-1/60fps/bbb-clear-1080/manifest.mpd",
        "");
    var model8 = MediaItemModel(
        "HLS",
        "https://devstreaming-cdn.apple.com/videos/streaming/examples/bipbop_4x3/bipbop_4x3_variant.m3u8",
        "");
    var model9 = MediaItemModel(
        "SmoothStreaming",
        "https://playready.directtaps.net/smoothstreaming/SSWSS720H264/SuperSpeedway_720.ism/Manifest",
        "");
    var model10 = MediaItemModel(
        "IMA sample ad tags",
        "https://storage.googleapis.com/exoplayer-test-media-1/mkv/android-screens-lavf-56.36.100-aac-avc-main-1280x720.mkv",
        "");
    _mediaList.add(model1);
    _mediaList.add(model2);
    _mediaList.add(model3);
    _mediaList.add(model4);
    _mediaList.add(model5);
    _mediaList.add(model6);
    _mediaList.add(model7);
    _mediaList.add(model8);
    _mediaList.add(model9);
    _mediaList.add(model10);
  }

  @override
  void initState() {
    _createMediaList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exo Media Sample List"),
      ),
      body: ListView.builder(
        itemBuilder: (context, position) {
          return GestureDetector(
            onTap: () => _onListItemClick(_mediaList[position]),
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child: Text(
                  _mediaList[position].title,
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
              ),
            ),
          );
        },
        itemCount: _mediaList.length,
      ),
    );
  }

  _onListItemClick(MediaItemModel model) {
    print(model.title);
    Navigator.push<PlayerScreen>(
      context,
      MaterialPageRoute<PlayerScreen>(
          builder: (BuildContext context) =>
              PlayerScreen(model)),
    );
  }
}

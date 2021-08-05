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
    int i = 0;
    while (i < 8) {
      var model = MediaItemModel(
          "Media Item $i",
          "https://storage.googleapis.com/wvmedia/cenc/h264/tears/tears.mpd",
          "https://proxy.uat.widevine.com/proxy?video_id=d286538032258a1c&provider=widevine_test");
      _mediaList.add(model);
      i++;
    }
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
        title: Text("Media List"),
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
              PlayerScreen(model.url, model.drmLicenseUrl)),
    );
  }
}

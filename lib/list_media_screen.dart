import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_native/model/PlayList.dart';
import 'package:flutter_app_native/model/Samples.dart';
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

  Future<String> loadJson() async {
    String data = await rootBundle.loadString('assets/media.exolist.json');
    final parsed = json.decode(data).cast<Map<String, dynamic>>();
    final parsedModel = parsed
        .map<MediaItemModel>((json) => MediaItemModel.fromJson(json))
        .toList();
    setState(() {
      _mediaList = parsedModel;
    });
    return 'success';
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await loadJson();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exo Media Sample List"),
      ),
      body: ListView.builder(
        itemCount: _mediaList.length,
        itemBuilder: (context, position) {
          var name = _mediaList[position].name;
          var samples = _mediaList[position].samples;
          return ExpansionTile(
            title: new Text(
              name,
              style: new TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic),
            ),
            children: <Widget>[
              new Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: _buildExpandableContent(samples),
              ),
            ],
          );
        },
      ),
    );
  }

  _buildExpandableContent(List<ItemModel> list) {
    List<Widget> columnContent = [];
    for (ItemModel content in list)
      columnContent.add(
        GestureDetector(
          onTap: () {
            _onListItemClick(content);
          },
          child: content.playlist != null
              ? ExpansionTile(
                  title: new Text(
                    content.name,
                    style: new TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                  ),
                  children: <Widget>[
                    new Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children:
                          _buildExpandableContentForPlayList(content.playlist),
                    ),
                  ],
                )
              : ListTile(
                  title: new Text(
                    content.name,
                    style: new TextStyle(fontSize: 18.0),
                  ),
                  leading: new Icon(Icons.play_arrow),
                ),
        ),
      );

    return columnContent;
  }

  _buildExpandableContentForPlayList(List<PlayListModel> list) {
    List<Widget> columnContent = [];
    for (PlayListModel content in list)
      columnContent.add(
        GestureDetector(
          onTap: () {
            // _onListItemClick(content);
          },
          child: ListTile(
            title: new Text(
              content.uri,
              style: new TextStyle(fontSize: 18.0),
            ),
            leading: new Icon(Icons.play_arrow),
          ),
        ),
      );

    return columnContent;
  }

  _onListItemClick(ItemModel model) {
    print(model.name);
    Navigator.push<PlayerScreen>(
      context,
      MaterialPageRoute<PlayerScreen>(
          builder: (BuildContext context) => PlayerScreen(model)),
    );
  }
}

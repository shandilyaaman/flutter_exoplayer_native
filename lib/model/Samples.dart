import 'package:flutter_app_native/model/PlayList.dart';

class ItemModel {
  final String uri;
  final String drm_license_uri;
  final String name;
  final String drm_scheme;
  final String ad_tag_uri;
  final String subtitle_uri;
  final String subtitle_mime_type;
  final String subtitle_language;
  final List<PlayListModel> playlist;

  const ItemModel(
      {this.uri,
      this.drm_license_uri,
      this.name,
      this.drm_scheme,
      this.ad_tag_uri,
      this.subtitle_uri,
      this.subtitle_mime_type,
      this.subtitle_language,
      this.playlist});

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    var playListData = (json['playlist'] as List);
    return ItemModel(
        uri: json['uri'] as String,
        drm_license_uri: json['drm_license_uri'] as String,
        name: json['name'] as String,
        drm_scheme: json['drm_scheme'] as String,
        ad_tag_uri: json['ad_tag_uri'] as String,
        subtitle_uri: json['subtitle_uri'] as String,
        subtitle_mime_type: json['subtitle_mime_type'] as String,
        subtitle_language: json['subtitle_language'] as String,
        playlist:
            playListData?.map((e) => PlayListModel.fromJson(e))?.toList());
  }
}

import 'package:flutter_app_native/model/Samples.dart';

class MediaItemModel {
  final String name;
  final List<ItemModel> samples;

  const MediaItemModel({this.name, this.samples});

  factory MediaItemModel.fromJson(Map<String, dynamic> json) {
    return MediaItemModel(
        name: json['name'] as String,
        samples: (json['samples'] as List)
            .map((e) => ItemModel.fromJson(e))
            .toList());
  }
}

class PlayListModel {
  final String uri;
  final String drm_license_uri;
  final String name;
  final int clip_end_position_ms;
  final int clip_start_position_ms;

  const PlayListModel(
      {this.uri,
      this.drm_license_uri,
      this.name,
      this.clip_end_position_ms,
      this.clip_start_position_ms});

  factory PlayListModel.fromJson(Map<String, dynamic> json) {
    return PlayListModel(
        uri: json['uri'] as String,
        drm_license_uri: json['drm_license_uri'] as String,
        name: json['name'] as String,
        clip_start_position_ms: json['clip_start_position_ms'] as int,
        clip_end_position_ms: json['clip_end_position_ms'] as int);
  }
}

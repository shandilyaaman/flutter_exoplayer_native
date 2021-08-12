# Exoplayer with DRM Implementation in Flutter android.

A flutter application that use native android exoplayer to play video content. It has also implemented drm in exoplayer.
You can pass drm license url along with video url if it has right protected content.

## Getting Started

Goal is to create a application in flutter using Exoplayer as video player. 
As of now i have implemented exoplayer as native media streaming player for android platform. Trying to implement all popular media streaming formats witt and without DRM. 
All UI part is done in flutter only. Using platform method channel api available in flutter to create communication bridge between host(native platform code) and consumer(flutter here). 
Also for demo purpose i have loaded all streaming url that is available in Exeplayer demo provided by Google.(https://github.com/google/ExoPlayer/tree/release-v2/demos/main/src/main/assets)

A few resources to get you started if this is your first Flutter and Exoplayer project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)
- [Exoplayer:Android Developers](https://developer.android.com/guide/topics/media/exoplayer)
- [Lab: Media streaming with ExoPlayer](https://developer.android.com/codelabs/exoplayer-intro#0)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

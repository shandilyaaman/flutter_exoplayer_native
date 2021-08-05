// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: public_member_api_docs

/// An example of using the plugin, controlling lifecycle and playback of the
/// video.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_app_native/list_media_screen.dart';
import 'package:flutter_app_native/player/video_player.dart';

void main() {
  runApp(
    MaterialApp(
      home: ListMediaScreen(),
    ),
  );
}

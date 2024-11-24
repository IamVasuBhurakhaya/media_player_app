import 'package:flutter/material.dart';
import 'package:media_player_app/screens/home/views/home_screen.dart';
import 'package:media_player_app/screens/music/music_screen.dart';
import 'package:media_player_app/screens/video/video_screen.dart';

class AppRoutes {
  static const String home = '/';
  static const String music = "music_screen";
  static const String video = "video_screen";

  static Map<String, WidgetBuilder> routes = {
    home: (context) => const HomeScreen(),
    music: (context) => MusicScreen(),
    video: (context) => const VideoScreen(),
  };
}

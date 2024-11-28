import 'package:flutter/material.dart';
import 'package:media_player_app/screens/home/views/home_screen.dart';
import 'package:media_player_app/screens/music/music_screen.dart';
import 'package:media_player_app/screens/music/second_screen.dart';
import 'package:media_player_app/screens/video/views/video_screen.dart';

class AppRoutes {
  static const String home = '/';
  static const String music = "music_screen";
  static const String video = "video_screen";
  static const String second = "second_screen";

  static Map<String, WidgetBuilder> routes = {
    home: (context) => const HomeScreen(),
    music: (context) => const MusicPage(),
    video: (context) => const VideoScreen(),
    second: (context) => const SecondScreen()
  };
}

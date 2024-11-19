import 'package:flutter/material.dart';
import 'package:media_player_app/screens/home/home_screen.dart';

class AppRoutes {
  static const String audioPlayer = '/';
  static Map<String, WidgetBuilder> routes = {
    audioPlayer: (context) => AudioPlayerScreen(),
  };
}

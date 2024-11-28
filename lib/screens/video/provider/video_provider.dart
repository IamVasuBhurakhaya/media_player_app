import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoProvider with ChangeNotifier {
  String videoUrl =
      'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4';
  VideoPlayerController? controller;
  ChewieController? chewieController;
  List images = [
    "https://t4.ftcdn.net/jpg/05/71/97/81/360_F_571978179_m6GpeKbOt4aJ5WWfSKSWHEAdPj8pFGJz.jpg",
    "https://t4.ftcdn.net/jpg/05/71/97/81/360_F_571978179_m6GpeKbOt4aJ5WWfSKSWHEAdPj8pFGJz.jpg",
    "https://t4.ftcdn.net/jpg/05/71/97/81/360_F_571978179_m6GpeKbOt4aJ5WWfSKSWHEAdPj8pFGJz.jpg",
    "https://t4.ftcdn.net/jpg/05/71/97/81/360_F_571978179_m6GpeKbOt4aJ5WWfSKSWHEAdPj8pFGJz.jpg",
    "https://t4.ftcdn.net/jpg/05/71/97/81/360_F_571978179_m6GpeKbOt4aJ5WWfSKSWHEAdPj8pFGJz.jpg",
  ];
  int pageIndex = 0;

  Future<void> init() async {
    controller = VideoPlayerController.networkUrl(
      Uri.parse(videoUrl),
    );
    await controller!.initialize();
    chewieController = ChewieController(
      videoPlayerController: controller!,
      autoPlay: true,
      looping: true,
    );
    notifyListeners();
  }

  void playOrPause() {
    if (controller!.value.isPlaying) {
      controller!.pause();
    } else {
      controller!.play();
    }
    notifyListeners();
  }

  void changeIndex(int index) {
    pageIndex = index;
    notifyListeners();
  }
}

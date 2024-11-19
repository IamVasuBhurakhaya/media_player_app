import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();
  bool isPlay = false;

  Duration liveDuration = Duration(seconds: 0);
  Duration totalDuration = Duration(seconds: 0);

  void initPlayer() {
    audioPlayer.open(
      Audio.network(
          "https://pagalfree.com/musics/128-Singham Again Title Track - Singham Again 128 Kbps.mp3"),
      autoStart: true,
      showNotification: true,
    );
  }

  void playOrPause() {
    if (audioPlayer.isPlaying.value) {
      audioPlayer.pause();
      isPlay = false;
    } else {
      audioPlayer.play();
      isPlay = true;
    }
    notifyListeners();
  }

  void getMusicDuration() {
    audioPlayer.current.listen((event) {
      totalDuration = event!.audio.duration;
      notifyListeners();
    });
  }

  void getLiveDuration() {
    audioPlayer.currentPosition.listen((event) {
      liveDuration = event;
      notifyListeners();
    });
  }

  void seekMusic(Duration d1) {
    audioPlayer.seek(d1);
  }
}

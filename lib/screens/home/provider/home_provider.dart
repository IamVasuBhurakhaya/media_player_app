import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();
  bool isPlay = false;

  Duration liveDuration = Duration(seconds: 0);
  Duration totalDuration = Duration(seconds: 0);

  List<Audio> audioLink = [
    Audio.network(
        "https://pagalfree.com/musics/128-Aayi Nai - Stree 2 128 Kbps.mp3"),
    Audio.network(
        "https://pagalfree.com/musics/128-Bhool Bhulaiyaa 3 - Title Track (Feat. Pitbull) - Bhool Bhulaiyaa 3 128 Kbps.mp3"),
    Audio.network(
        "https://pagalfree.com/musics/128-Aaj Ki Raat - Stree 2 128 Kbps.mp3"),
    Audio.network(
        "https://pagalfree.com/musics/128-Angaaron - Pushpa 2 The Rule 128 Kbps.mp3"),
    Audio.network(
        "https://pagalfree.com/musics/128-Lutt Putt Gaya - Dunki 128 Kbps.mp3"),
    Audio.network(
        "https://pagalfree.com/musics/128-Matargashti - Tamasha 128 Kbps.mp3"),
    Audio.network(
        "https://pagalfree.com/musics/128-Dhoom Taana - Om Shanti Om 128 Kbps.mp3"),
    Audio.network(
        "https://pagalfree.com/musics/128-Mast Magan - 2 States 128 Kbps.mp3"),
    Audio.network(
        "https://pagalfree.com/musics/128-Ishq Di Baajiyaan - Soorma 128 Kbps.mp3"),
    Audio.network(
        "https://pagalfree.com/musics/128-Ilahi - Yeh Jawaani Hai Deewani 128 Kbps.mp3"),
    Audio.network(
        "https://pagalfree.com/musics/128-Ghagra - Yeh Jawaani Hai Deewani 128 Kbps.mp3"),
    Audio.network(
        "https://pagalfree.com/musics/128-Dilliwaali Girlfriend - Yeh Jawaani Hai Deewani 128 Kbps.mp3"),
    Audio.network(
        "https://pagalfree.com/musics/128-Balam Pichkari - Yeh Jawaani Hai Deewani 128 Kbps.mp3"),
    Audio.network(
        "https://pagalfree.com/musics/128-London Thumakda - Queen 128 Kbps.mp3"),
    Audio.network(
        "https://pagalfree.com/musics/128-Ranjha (Queen) - Queen 128 Kbps.mp3"),
    Audio.network(
        "https://pagalfree.com/musics/128-Nadaan Parindey - Rockstar 128 Kbps.mp3"),
    Audio.network(
        "https://pagalfree.com/musics/128-Phir Se Ud Chala - Rockstar 128 Kbps.mp3"),
    Audio.network(
        "https://pagalfree.com/musics/128-Kabira - Yeh Jawaani Hai Deewani 128 Kbps.mp3"),
  ];

  // void initPlayer() {
  //   audioPlayer.open(
  //     Audio.network(
  //         "https://pagalfree.com/musics/128-Singham Again Title Track - Singham Again 128 Kbps.mp3"),
  //     autoStart: true,
  //     showNotification: true,
  //   );
  // }

  void initPlayer() {
    audioPlayer.open(
      Playlist(
        audios: audioLink,
        startIndex: 0,
      ),
      showNotification: true,
      autoStart: true,
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

  void previousSong() {
    isPlay = true;
    audioPlayer.previous();
    notifyListeners();
  }

  void nextSong() {
    isPlay = true;
    audioPlayer.next();
    notifyListeners();
  }
}

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:media_player_app/screens/home/model/home_model.dart';

class HomeProvider extends ChangeNotifier {
  AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();
  bool isPlay = false;
  bool isPlaying = false;
  int currentIndex = 0;

  Duration liveDuration = Duration(seconds: 0);
  Duration totalDuration = Duration(seconds: 0);
//list of song
  // List<Audio> audioLink = [
  //   Audio.network(
  //       "https://pagalfree.com/musics/128-Aayi Nai - Stree 2 128 Kbps.mp3"),
  //   Audio.network(
  //       "https://pagalfree.com/musics/128-Bhool Bhulaiyaa 3 - Title Track (Feat. Pitbull) - Bhool Bhulaiyaa 3 128 Kbps.mp3"),
  //   Audio.network(
  //       "https://pagalfree.com/musics/128-Aaj Ki Raat - Stree 2 128 Kbps.mp3"),
  //   Audio.network(
  //       "https://pagalfree.com/musics/128-Angaaron - Pushpa 2 The Rule 128 Kbps.mp3"),
  //   Audio.network(
  //       "https://pagalfree.com/musics/128-Lutt Putt Gaya - Dunki 128 Kbps.mp3"),
  //   Audio.network(
  //       "https://pagalfree.com/musics/128-Matargashti - Tamasha 128 Kbps.mp3"),
  //   Audio.network(
  //       "https://pagalfree.com/musics/128-Dhoom Taana - Om Shanti Om 128 Kbps.mp3"),
  //   Audio.network(
  //       "https://pagalfree.com/musics/128-Mast Magan - 2 States 128 Kbps.mp3"),
  //   Audio.network(
  //       "https://pagalfree.com/musics/128-Ishq Di Baajiyaan - Soorma 128 Kbps.mp3"),
  //   Audio.network(
  //       "https://pagalfree.com/musics/128-Ilahi - Yeh Jawaani Hai Deewani 128 Kbps.mp3"),
  //   Audio.network(
  //       "https://pagalfree.com/musics/128-Ghagra - Yeh Jawaani Hai Deewani 128 Kbps.mp3"),
  //   Audio.network(
  //       "https://pagalfree.com/musics/128-Dilliwaali Girlfriend - Yeh Jawaani Hai Deewani 128 Kbps.mp3"),
  //   Audio.network(
  //       "https://pagalfree.com/musics/128-Balam Pichkari - Yeh Jawaani Hai Deewani 128 Kbps.mp3"),
  //   Audio.network(
  //       "https://pagalfree.com/musics/128-London Thumakda - Queen 128 Kbps.mp3"),
  //   Audio.network(
  //       "https://pagalfree.com/musics/128-Ranjha (Queen) - Queen 128 Kbps.mp3"),
  //   Audio.network(
  //       "https://pagalfree.com/musics/128-Nadaan Parindey - Rockstar 128 Kbps.mp3"),
  //   Audio.network(
  //       "https://pagalfree.com/musics/128-Phir Se Ud Chala - Rockstar 128 Kbps.mp3"),
  //   Audio.network(
  //       "https://pagalfree.com/musics/128-Kabira - Yeh Jawaani Hai Deewani 128 Kbps.mp3"),
  // ];

  // void initPlayer() {
  //   audioPlayer.open(
  //     Audio.network(
  //         "https://pagalfree.com/musics/128-Singham Again Title Track - Singham Again 128 Kbps.mp3"),
  //     autoStart: true,
  //     showNotification: true,
  //   );
  // }

  List<MusicModel> musicList = [
    // MusicModel(
    //   title: 'Singham Again Title Track',
    //   path:
    //       'https://pagalfree.com/musics/128-Singham Again Title Track - Singham Again 128 Kbps.mp3',
    //   image:
    //       'https://pagalfree.com/images/128Singham Again Title Track - Singham Again 128 Kbps.jpg',
    // ),
    // MusicModel(
    //   title: 'Bhool Bhulaiyaa 3',
    //   path:
    //       "https://pagalfree.com/musics/128-Bhool Bhulaiyaa 3 - Title Track (Feat. Pitbull) - Bhool Bhulaiyaa 3 128 Kbps.mp3",
    //   image:
    //       'https://pagalfree.com/images/128Bhool Bhulaiyaa 3 - Title Track (Feat. Pitbull) - Bhool Bhulaiyaa 3 128 Kbps.jpg',
    // ),
    // MusicModel(
    //   title: 'Pushpa Pushpa',
    //   path:
    //       'https://pagalfree.com/musics/128-Pushpa Pushpa - Pushpa 2 The Rule 128 Kbps.mp3',
    //   image:
    //       'https://pagalfree.com/images/128Pushpa Pushpa - Pushpa 2 The Rule 128 Kbps.jpg',
    // ),

    MusicModel(
      title: 'Aayi nai',
      path: 'https://pagalfree.com/musics/128-Aayi Nai - Stree 2 128 Kbps.mp3',
      Singerimage:
          'https://upload.wikimedia.org/wikipedia/commons/3/3e/Divya_Kumar_Singer.jpg',
    ),
    MusicModel(
      title: 'Bhul bhulaiyaa',
      path:
          'https://pagalfree.com/musics/128-Bhool Bhulaiyaa 3 - Title Track (Feat. Pitbull) - Bhool Bhulaiyaa 3 128 Kbps.mp3',
      Singerimage:
          'https://a10.gaanacdn.com/gn_img/artists/21GWwrR3pk/1GWwYz4DKp/size_m_1717412444.jpg',
    ),
    MusicModel(
      title: 'Aaj ki raat',
      path:
          'https://pagalfree.com/musics/128-Aaj Ki Raat - Stree 2 128 Kbps.mp3',
      Singerimage:
          'https://upload.wikimedia.org/wikipedia/commons/3/3e/Divya_Kumar_Singer.jpg',
    ),
    MusicModel(
      title: 'Angaaron',
      path:
          'https://pagalfree.com/musics/128-Angaaron - Pushpa 2 The Rule 128 Kbps.mp3',
      Singerimage:
          'https://morungexpress.com/uploads/2023/08/61842253_1691245642_asc.jpg',
    ),
    MusicModel(
      title: 'Lutt Putt Gaya',
      path:
          'https://pagalfree.com/musics/128-Lutt Putt Gaya - Dunki 128 Kbps.mp3',
      Singerimage:
          'https://i.pinimg.com/236x/47/f3/02/47f302ef70acddc760253aa64d2db81e.jpg',
    ),
    MusicModel(
      title: 'Matargashti',
      path:
          'https://pagalfree.com/musics/128-Matargashti - Tamasha 128 Kbps.mp3',
      Singerimage:
          'https://blackhattalent.com/wp-content/uploads/2023/07/Mohit-Chauhan.jpg',
    ),
    MusicModel(
      title: 'Dhoom Taana',
      path:
          'https://pagalfree.com/musics/128-Dhoom Taana - Om Shanti Om 128 Kbps.mp3',
      Singerimage:
          'https://morungexpress.com/uploads/2023/08/61842253_1691245642_asc.jpg',
    ),
    MusicModel(
      title: 'Mast Magan',
      path:
          'https://pagalfree.com/musics/128-Mast Magan - 2 States 128 Kbps.mp3',
      Singerimage:
          'https://i.pinimg.com/236x/47/f3/02/47f302ef70acddc760253aa64d2db81e.jpg',
    ),
    MusicModel(
      title: 'Ishq Di Baajiyaan',
      path:
          'https://pagalfree.com/musics/128-Ishq Di Baajiyaan - Soorma 128 Kbps.mp3',
      Singerimage:
          'https://i.pinimg.com/550x/e6/b0/e9/e6b0e9d9d75a2467289ae88cabecb351.jpg',
    ),
    MusicModel(
      title: 'Ilahi',
      path:
          'https://pagalfree.com/musics/128-Ilahi - Yeh Jawaani Hai Deewani 128 Kbps.mp3',
      Singerimage:
          'https://i.pinimg.com/236x/47/f3/02/47f302ef70acddc760253aa64d2db81e.jpg',
    ),
    MusicModel(
      title: 'Ghagra',
      path:
          'https://pagalfree.com/musics/128-Ghagra - Yeh Jawaani Hai Deewani 128 Kbps.mp3',
      Singerimage:
          'https://a10.gaanacdn.com/gn_img/artists/JD2KJAbOLw/JD2KJwO3OL/size_m_1720178036.jpg',
    ),
    MusicModel(
      title: 'Dilliwaali Girlfriend',
      path:
          'https://pagalfree.com/musics/128-Dilliwaali Girlfriend - Yeh Jawaani Hai Deewani 128 Kbps.mp3',
      Singerimage:
          'https://i.pinimg.com/236x/47/f3/02/47f302ef70acddc760253aa64d2db81e.jpg',
    ),
    MusicModel(
      title: 'Pichkari',
      path:
          'https://pagalfree.com/musics/128-Balam Pichkari - Yeh Jawaani Hai Deewani 128 Kbps.mp3',
      Singerimage:
          'https://m.media-amazon.com/images/M/MV5BODcwNmZhMmUtYjNlYy00MjcwLWEwOWYtZTJmODFlOTM2NTgzXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg',
    ),
    MusicModel(
      title: 'London Thumakda ',
      path:
          'https://pagalfree.com/musics/128-London Thumakda - Queen 128 Kbps.mp3',
      Singerimage:
          'https://www.koimoi.com/wp-content/new-galleries/2020/05/neha-kakkar-never-thought-about-where-ive-reached-today-001.jpg',
    ),
    MusicModel(
      title: 'Ranjha',
      path:
          'https://pagalfree.com/musics/128-Ranjha (Queen) - Queen 128 Kbps.mp3',
      Singerimage:
          'https://i.pinimg.com/736x/c2/f3/d5/c2f3d5e0cd191eb7fa0f26ecf01ce2e1.jpg',
    ),
    MusicModel(
      title: 'Nadaan Parindey',
      path:
          'https://pagalfree.com/musics/128-Nadaan Parindey - Rockstar 128 Kbps.mp3',
      Singerimage:
          'https://i.pinimg.com/736x/8a/33/7e/8a337e8142145d98801ea4a5700d60fb.jpg',
    ),
    MusicModel(
      title: 'Phir Se Ud Chala ',
      path:
          'https://pagalfree.com/musics/128-Phir Se Ud Chala - Rockstar 128 Kbps.mp3',
      Singerimage:
          'https://blackhattalent.com/wp-content/uploads/2023/07/Mohit-Chauhan.jpg',
    ),
    MusicModel(
      title: 'Kabira',
      path:
          'https://pagalfree.com/musics/128-Kabira - Yeh Jawaani Hai Deewani 128 Kbps.mp3',
      Singerimage:
          'https://i1.sndcdn.com/artworks-000109706851-qi28va-t500x500.jpg',
    ),
  ];

  HomeProvider() {
    initListeners();
  }

  void initListeners() {
    audioPlayer.currentPosition.listen((position) {
      liveDuration = position;
      notifyListeners();
    });

    audioPlayer.current.listen((playing) {
      totalDuration = playing?.audio.duration ?? Duration.zero;
      notifyListeners();
    });
  }

  // void initPlayer() {
  //   audioPlayer.open(
  //     Playlist(
  //       audios: audioLink,
  //       startIndex: 0,
  //     ),
  //     showNotification: true,
  //     autoStart: true,
  //   );
  // }
  //
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

  void playSong(int index) {
    currentIndex = index;
    audioPlayer.open(
      Audio.network(musicList[index].path!),
      autoStart: true,
      showNotification: true,
    );
    isPlaying = true;
    notifyListeners();
  }

  void pauseSong() {
    audioPlayer.pause();
    isPlaying = false;
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

  // void seekMusic(Duration d1) {
  //   audioPlayer.seek(d1);
  // }
  //
  // void previousSong() {
  //   isPlay = true;
  //   audioPlayer.previous();
  //   notifyListeners();
  // }
  //
  // void nextSong() {
  //   isPlay = true;
  //   audioPlayer.next();
  //   notifyListeners();
  // }

  void nextSong() {
    currentIndex = (currentIndex + 1) % musicList.length;
    playSong(currentIndex);
  }

  void previousSong() {
    currentIndex = (currentIndex - 1 + musicList.length) % musicList.length;
    playSong(currentIndex);
  }

  void seekTo(Duration position) {
    audioPlayer.seek(position);
    notifyListeners();
  }
}

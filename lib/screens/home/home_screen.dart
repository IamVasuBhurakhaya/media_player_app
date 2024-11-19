import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:media_player_app/screens/provider/home_provider.dart';
import 'package:provider/provider.dart';

class AudioPlayerScreen extends StatelessWidget {
  AudioPlayerScreen({super.key});

  final AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();

  HomeProvider providerR = HomeProvider();
  HomeProvider providerW = HomeProvider();

  @override
  Widget build(BuildContext context) {
    providerR = context.read<HomeProvider>();
    providerW = context.watch<HomeProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Network Audio Player'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                audioPlayer.open(
                  Audio.network(
                      "https://pagalfree.com/musics/128-Singham Again Title Track - Singham Again 128 Kbps.mp3"),
                  autoStart: true,
                  showNotification: true,
                );
              },
              child: const Text('Play Network Audio'),
            ),
            ElevatedButton(
              onPressed: () {
                audioPlayer.pause();
              },
              child: const Text('Pause Audio'),
            ),
            ElevatedButton(
              onPressed: () {
                audioPlayer.stop();
              },
              child: const Text('Stop Audio'),
            ),
          ],
        ),
      ),
    );
  }
}

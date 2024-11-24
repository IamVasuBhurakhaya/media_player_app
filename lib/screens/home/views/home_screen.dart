import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:media_player_app/routes/appRoutes.dart';
import 'package:media_player_app/screens/home/provider/home_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeProvider provider;
  final AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();

  final List<Map<String, String>> songs = [
    {
      'title': 'Singham Again Title Track',
      'artist': 'Om Savani',
      'url':
          'https://pagalfree.com/musics/128-Singham Again Title Track - Singham Again 128 Kbps.mp3',
      'image':
          'https://pagalfree.com/images/128Singham Again Title Track - Singham Again 128 Kbps.jpg',
    },
    {
      'title': 'Bhul Bhulaiya',
      'artist': 'Om Savani',
      'url':
          'https://pagalfree.com/musics/128-Bhool%20Bhulaiyaa%203%20-%20Title%20Track%20(Feat.%20Pitbull)%20-%20Bhool%20Bhulaiyaa%203%20128%20Kbps.mp3',
      'image':
          'https://pagalfree.com/images/128Bhool Bhulaiyaa 3 - Title Track (Feat. Pitbull) - Bhool Bhulaiyaa 3 128 Kbps.jpg',
    },
    {
      'title': 'Pushpa 2',
      'artist': 'Om Savani',
      'url':
          'https://pagalfree.com/musics/128-Pushpa Pushpa - Pushpa 2 The Rule 128 Kbps.mp3',
      'image':
          'https://pagalfree.com/images/128Pushpa Pushpa - Pushpa 2 The Rule 128 Kbps.jpg',
    },
  ];

  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    provider = context.read<HomeProvider>();
    provider.initPlayer();
    _playSong(currentIndex);
  }

  void _playSong(int index) {
    final song = songs[index];
    audioPlayer.open(
      Audio.network(song['url']!),
      autoStart: true,
      showNotification: true,
    );
  }

  void _nextSong() {
    setState(() {
      currentIndex = (currentIndex + 1) % songs.length;
    });
    _playSong(currentIndex);
  }

  void _previousSong() {
    setState(() {
      currentIndex = (currentIndex - 1 + songs.length) % songs.length;
    });
    _playSong(currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    final currentSong = songs[currentIndex];

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Song List', style: TextStyle(fontSize: 24)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: songs.length,
                itemBuilder: (context, index) {
                  final song = songs[index];
                  return Card(
                    color: Colors.black,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(10),
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(song['image']!),
                      ),
                      title: Text(
                        song['title']!,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        song['artist']!,
                        style: TextStyle(color: Colors.grey[400], fontSize: 14),
                      ),
                      trailing: IconButton(
                        icon: const Icon(
                          Icons.play_arrow,
                          color: Colors.green,
                        ),
                        onPressed: () {
                          setState(() {
                            currentIndex = index;
                          });
                          _playSong(index);
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Container(
              alignment: Alignment.center,
              height: 250,
              width: 250,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(currentSong['image']!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              currentSong['title']!,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              currentSong['artist']!,
              style: TextStyle(color: Colors.grey[400], fontSize: 18),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.skip_previous, color: Colors.white),
                  iconSize: 40,
                  onPressed: _previousSong,
                ),
                Consumer<HomeProvider>(
                  builder: (context, provider, child) {
                    return FloatingActionButton(
                      onPressed: () {
                        provider.playOrPause();
                      },
                      backgroundColor: Colors.green,
                      child: Icon(
                        provider.isPlay ? Icons.pause : Icons.play_arrow,
                        size: 50,
                        color: Colors.white,
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.skip_next, color: Colors.white),
                  iconSize: 40,
                  onPressed: _nextSong,
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(AppRoutes.music);
        },
        child: Text("Enter"),
      ),
    );
  }
}

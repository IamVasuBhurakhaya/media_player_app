import 'package:flutter/material.dart';
import 'package:media_player_app/routes/appRoutes.dart';
import 'package:media_player_app/screens/home/provider/home_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final watch = context.watch<HomeProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Music Player'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.video);
              },
              icon: const Icon(Icons.video_call))
        ],
      ),
      body: ListView.builder(
        itemCount: watch.musicList.length,
        itemBuilder: (context, index) {
          final song = watch.musicList[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            child: ListTile(
              onTap: () {
                context.read<HomeProvider>().playSong(index);
                Navigator.pushNamed(context, AppRoutes.music);
              },
              contentPadding: const EdgeInsets.all(10),
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(song.singerImage ?? ""),
              ),
              title: Text(song.title ?? "Unknown Title"),
              // trailing: IconButton(
              //   icon: const Icon(Icons.play_arrow, color: Colors.black),
              //   onPressed: () {
              //
              //   },
              // ),
            ),
          );
        },
      ),
    );
  }
}

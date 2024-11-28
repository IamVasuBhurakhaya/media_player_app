import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:media_player_app/routes/appRoutes.dart';
import 'package:provider/provider.dart';
import 'package:media_player_app/screens/home/provider/home_provider.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    final watch = context.watch<HomeProvider>();
    final read = context.read<HomeProvider>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.bar_chart_sharp,
              color: Colors.black,
              size: 35,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: double.infinity,
                height: 400,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      watch.musicList[watch.currentIndex].musicImage ?? '',
                    ),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.white.withOpacity(0.2),
                        Colors.white.withOpacity(0.5),
                      ],
                    ),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        watch.musicList[watch.currentIndex].title ??
                            'Unknown Title',
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Artist: ${watch.musicList[watch.currentIndex].singerName ?? 'Unknown Artist'}",
                        style: GoogleFonts.lato(
                          color: Colors.black.withOpacity(0.7),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: -40,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Slider(
                    activeColor: Colors.blueAccent,
                    inactiveColor: Colors.grey[300],
                    value: watch.liveDuration.inSeconds.toDouble(),
                    max: watch.totalDuration.inSeconds.toDouble(),
                    onChanged: (value) {
                      watch.seekTo(Duration(seconds: value.toInt()));
                    },
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.shuffle,
                      color: Colors.blueAccent, size: 30),
                  onPressed: () {
                    watch.musicList.shuffle();
                  },
                ),
                const SizedBox(width: 20),
                IconButton(
                  icon: const Icon(Icons.skip_previous,
                      color: Colors.blueAccent, size: 40),
                  onPressed: () {
                    watch.previousSong();
                  },
                ),
                const SizedBox(width: 20),
                IconButton(
                  icon: Icon(
                    watch.isPlay
                        ? Icons.pause_circle_filled
                        : Icons.play_circle_filled,
                    color: Colors.blueAccent,
                    size: 70,
                  ),
                  onPressed: () {
                    read.playOrPause();
                  },
                ),
                const SizedBox(width: 20),
                IconButton(
                  icon: const Icon(Icons.skip_next,
                      color: Colors.blueAccent, size: 40),
                  onPressed: () {
                    watch.nextSong();
                  },
                ),
                const SizedBox(width: 20),
                IconButton(
                  icon: const Icon(Icons.repeat_one,
                      color: Colors.blueAccent, size: 30),
                  onPressed: () {
                    watch.playSong(watch.currentIndex);
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: watch.musicList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 5,
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          watch.musicList[index].musicImage ?? '',
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(
                        watch.musicList[index].title ?? "Unknown Title",
                        style: GoogleFonts.lato(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      subtitle: Text(
                        "Artist: ${watch.musicList[index].singerName ?? 'Unknown Artist'}",
                        style: GoogleFonts.lato(
                          color: Colors.black.withOpacity(0.7),
                          fontSize: 14,
                        ),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black.withOpacity(0.7),
                      ),
                      onTap: () {
                        Navigator.of(context).pushNamed(AppRoutes.music);
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:media_player_app/routes/appRoutes.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:provider/provider.dart';
import 'package:media_player_app/screens/home/provider/home_provider.dart';

Color primaryCol = const Color(0xff8A051C); // Maroon
Color primaryCol1 = const Color(0xff003366); // Navy Blue
Color primaryCol2 = const Color(0xffffd700); // Gold
Color primaryCol3 = const Color(0xff556b2f); // Olive Green
Color primaryCol4 = const Color(0xffCC5500); // Burnt Orange

class MusicPage extends StatelessWidget {
  const MusicPage({super.key});

  @override
  Widget build(BuildContext context) {
    final watch = context.watch<HomeProvider>();
    final read = context.read<HomeProvider>();

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xffefefef),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            read.pauseSong();
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.chevron_left,
            color: Colors.black,
            size: 35,
          ),
        ),
        actions: [
          Transform.rotate(
            angle: (270 / (180 / pi)),
            child: IconButton(
              icon: const Icon(
                Icons.bar_chart,
                color: Colors.black,
                size: 35,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.second);
              },
            ),
          ),
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            // Image container and circular slider
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 275,
                  height: 390,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black54,
                        offset: Offset(0, 20),
                        blurRadius: 30,
                        spreadRadius: 0,
                      ),
                    ],
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(200),
                      bottomRight: Radius.circular(200),
                    ),
                    image: DecorationImage(
                      colorFilter:
                          ColorFilter.mode(primaryCol3, BlendMode.multiply),
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          watch.musicList[watch.currentIndex].singerImage ??
                              ""),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        watch.musicList[watch.currentIndex].title ??
                            "Unknown Title",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "Artist Name", // Replace with actual artist name
                        style: GoogleFonts.lato(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 50),
                    ],
                  ),
                ),
                Positioned(
                  bottom: -45,
                  left: -40,
                  child: SleekCircularSlider(
                    min: 0,
                    max: watch.totalDuration.inSeconds.toDouble(),
                    initialValue: watch.liveDuration.inSeconds.toDouble(),
                    appearance: CircularSliderAppearance(
                      size: 360,
                      counterClockwise: true,
                      startAngle: 150,
                      angleRange: 120,
                      customWidths: CustomSliderWidths(
                        trackWidth: 3,
                        progressBarWidth: 10,
                        shadowWidth: 0,
                      ),
                      customColors: CustomSliderColors(
                        trackColor: Colors.black12,
                        progressBarColor: Colors.black,
                      ),
                      infoProperties: InfoProperties(
                        mainLabelStyle: const TextStyle(
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                    onChange: (value) {
                      read.seekTo(Duration(seconds: value.toInt()));
                    },
                  ),
                ),
              ],
            ),
            // Song List
            Expanded(
              child: ListView.builder(
                itemCount: watch.musicList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 60, right: 60),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${watch.musicList[index].title}",
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                color: index == watch.currentIndex
                                    ? primaryCol
                                    : Colors.black87,
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Text(
                            "${(watch.totalDuration.inSeconds / 60).toInt()}:${(watch.totalDuration.inSeconds % 60).toInt()}",
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                color: index == watch.currentIndex
                                    ? primaryCol
                                    : Colors.black87,
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 120,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                child: const Icon(Icons.shuffle),
                onTap: () {
                  // read.shuffle();
                },
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      read.previousSong();
                    },
                    child: const Icon(Icons.fast_rewind),
                  ),
                  const SizedBox(width: 20),
                  InkWell(
                    onTap: () {
                      read.playOrPause();
                    },
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 10),
                            blurRadius: 15,
                          ),
                        ],
                      ),
                      child: Icon(
                        watch.isPlay
                            ? Icons.pause_circle_filled
                            : Icons.play_circle_filled,
                        size: 60,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  InkWell(
                      onTap: () {
                        read.nextSong();
                      },
                      child: const Icon(Icons.fast_forward)),
                ],
              ),
              InkWell(
                child: const Icon(Icons.toc),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

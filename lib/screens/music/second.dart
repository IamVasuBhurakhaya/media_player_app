import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:media_player_app/screens/home/provider/home_provider.dart';

class MusicChartPage extends StatelessWidget {
  const MusicChartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final watch = context.watch<HomeProvider>();
    final read = context.read<HomeProvider>();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.chevron_left,
            color: Colors.black,
            size: 35,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.close,
              color: Colors.black,
              size: 35,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            // Custom designed container with circular slider
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 300,
                  height: 400,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black54,
                        offset: Offset(0, 10),
                        blurRadius: 30,
                      ),
                    ],
                    gradient: const LinearGradient(
                      colors: [Colors.purple, Colors.blue],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        watch.musicList[watch.currentIndex].singerImage ?? '',
                      ),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        watch.musicList[watch.currentIndex].title ??
                            'Unknown Title',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 10),
                      // Text(
                      //   "Artist: ${watch.musicList[watch.currentIndex].artist ?? 'Unknown Artist'}",
                      //   style: GoogleFonts.lato(
                      //     color: Colors.white,
                      //     fontSize: 16,
                      //     fontWeight: FontWeight.w400,
                      //   ),
                      // ),
                      const SizedBox(height: 50),
                    ],
                  ),
                ),
                Positioned(
                  bottom: -60,
                  left: -40,
                  child: SleekCircularSlider(
                    min: 0,
                    max: watch.totalDuration.inSeconds.toDouble(),
                    initialValue: watch.liveDuration.inSeconds.toDouble(),
                    appearance: CircularSliderAppearance(
                      size: 380,
                      counterClockwise: true,
                      startAngle: 150,
                      angleRange: 120,
                      customWidths: CustomSliderWidths(
                        trackWidth: 3,
                        progressBarWidth: 12,
                        shadowWidth: 0,
                      ),
                      customColors: CustomSliderColors(
                        trackColor: Colors.black12,
                        progressBarColor: Colors.white,
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
            // Song List (small cards layout)
            Expanded(
              child: ListView.builder(
                itemCount: watch.musicList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 40, right: 40),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: Card(
                        color: Colors.white.withOpacity(0.9),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        elevation: 5,
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          title: Text(
                            "${watch.musicList[index].title}",
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                color: index == watch.currentIndex
                                    ? Colors.purple
                                    : Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          // subtitle: Text(
                          //   "Artist: ${watch.musicList[index].artist ?? 'Unknown Artist'}",
                          //   style: GoogleFonts.lato(
                          //     color: Colors.black54,
                          //     fontSize: 14,
                          //   ),
                          // ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: index == watch.currentIndex
                                ? Colors.purple
                                : Colors.black,
                          ),
                          onTap: () {
                            // read.setCurrentSong(index);
                          },
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

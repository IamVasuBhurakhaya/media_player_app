import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

Color primaryCol = const Color(0xff8A051C); // Maroon
List<Map> songs = [
  {'song': 'Small Talk', 'duration': '4:29'},
  {'song': 'Bad Guy', 'duration': '2:45'},
  {'song': 'Boyfriend', 'duration': '3:28'},
  {'song': 'OMG', 'duration': '3:37'},
  {'song': 'Let Us Love', 'duration': '3:02'},
  {'song': 'July', 'duration': '3:42'},
];
int selectedSongIndex = 1;

class MusicScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xffefefef),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const IconButton(
          icon: Icon(
            Icons.chevron_left,
            color: Colors.black,
            size: 35,
          ),
          onPressed: null,
        ),
        actions: [
          Transform.rotate(
            angle: (270 / (180 / pi)), // Rotate by 270 degrees
            child: const IconButton(
              icon: Icon(
                Icons.bar_chart,
                color: Colors.black,
                size: 35,
              ),
              onPressed: null,
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
                          ColorFilter.mode(primaryCol, BlendMode.multiply),
                      fit: BoxFit.cover,
                      image: const NetworkImage(
                        "https://images.pexels.com/photos/4972607/pexels-photo-4972607.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
                      ),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Bad Guy",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Billie Eilish/Justin Bieber",
                        style: GoogleFonts.lato(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: -45,
                  left: -40,
                  child: SleekCircularSlider(
                    min: 0, // Song start time
                    max: 4, // Song end time (duration)
                    initialValue: 1, // Default value
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
                  ),
                ),
              ],
            ),
            // Song List
            Expanded(
              child: ListView.builder(
                itemCount: songs.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 60, right: 60),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${songs[index]['song']}",
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                color: index == selectedSongIndex
                                    ? primaryCol
                                    : Colors.black87,
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Text(
                            "${songs[index]['duration']}",
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                color: index == selectedSongIndex
                                    ? primaryCol
                                    : Colors.black87,
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
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
                onTap: () {},
              ),
              Row(
                children: [
                  const Icon(Icons.fast_rewind),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
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
                    child: const Icon(
                      Icons.pause_circle_filled,
                      size: 60,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Icon(Icons.fast_forward),
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

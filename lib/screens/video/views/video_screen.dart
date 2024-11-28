import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:media_player_app/screens/video/provider/video_provider.dart';
import 'package:provider/provider.dart';
import 'dart:ui';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late VideoProvider read;
  late VideoProvider watch;

  @override
  void initState() {
    super.initState();
    context.read<VideoProvider>().init().then((value) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    read = context.read<VideoProvider>();
    watch = context.watch<VideoProvider>();

    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.5),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Positioned.fill(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    color: Colors.black.withOpacity(0.2),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: InkWell(
                      onTap: () {
                        read.playOrPause();
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.4),
                                blurRadius: 20,
                                spreadRadius: 5,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          height: 250,
                          width: 350,
                          child: Chewie(
                            controller: watch.chewieController!,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

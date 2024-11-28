import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:media_player_app/screens/video/provider/video_provider.dart';
import 'package:provider/provider.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late VideoProvider read;
  late VideoProvider watch;
  CarouselController? controller;

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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Center(
              child: watch.controller!.value.isInitialized
                  ? InkWell(
                      onTap: () {
                        read.playOrPause();
                      },
                      child: SizedBox(
                          height: 300,
                          width: 400,
                          child: Chewie(
                            controller: watch.chewieController!,
                          )),
                    )
                  : const CircularProgressIndicator(),
            ),
            const SizedBox(
              height: 20,
            ),

            //
            // CarouselSlider(
            //   items: watch.images.map((index) {
            //     return Container(
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(10),
            //         image: DecorationImage(
            //           image: NetworkImage(index),
            //           fit: BoxFit.cover,
            //         ),
            //       ),
            //     );
            //   }).toList(),
            //   options: CarouselOptions(
            //       onPageChanged: (index, reason) {
            //         read.changeIndex(index);
            //       },
            //       height: 300,
            //       autoPlay: true,
            //       enlargeCenterPage: true,
            //       viewportFraction: 0.8,
            //       aspectRatio: 16 / 9,
            //       autoPlayInterval: const Duration(seconds: 2),
            //       autoPlayAnimationDuration: const Duration(milliseconds: 800),
            //       autoPlayCurve: Curves.fastOutSlowIn,
            //       scrollPhysics: const BouncingScrollPhysics()),
            // ),
            // const SizedBox(
            //   height: 5,
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: List.generate(watch.images.length, (index) {
            //     return Container(
            //       margin: const EdgeInsets.symmetric(horizontal: 5),
            //       height: 10,
            //       width: 10,
            //       decoration: BoxDecoration(
            //         shape: BoxShape.circle,
            //         color: watch.pageIndex == index
            //             ? Colors.orangeAccent
            //             : Colors.grey,
            //       ),
            //     );
            //   }),
            // )
          ],
        ),
      ),
    );
  }
}

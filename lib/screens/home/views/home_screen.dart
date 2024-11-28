import 'package:flutter/material.dart';
import 'package:media_player_app/routes/appRoutes.dart';
import 'package:media_player_app/screens/home/provider/home_provider.dart';
import 'package:media_player_app/screens/video/provider/video_provider.dart';
import 'package:media_player_app/screens/video/views/video_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late HomeProvider providerR;
  late HomeProvider providerW;

  late VideoProvider read;
  late VideoProvider watch;

  TabController? tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    providerR = context.read<HomeProvider>();
    providerW = context.watch<HomeProvider>();

    read = context.read<VideoProvider>();
    watch = context.watch<VideoProvider>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          backgroundColor: Colors.blueAccent,
          elevation: 4,
          bottom: TabBar(
            controller: tabController,
            indicatorColor: Colors.greenAccent,
            indicatorWeight: 4.0,
            labelColor: Colors.greenAccent,
            unselectedLabelColor: Colors.grey.shade600,
            tabs: const [
              Tab(
                icon: Icon(
                  Icons.music_note,
                  size: 30,
                ),
                text: 'Audio',
              ),
              Tab(
                icon: Icon(
                  Icons.video_collection,
                  size: 30,
                ),
                text: 'Video',
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TabBarView(
          controller: tabController,
          children: [
            ListView.builder(
              itemCount: providerW.musicList.length,
              itemBuilder: (context, index) {
                final song = providerW.musicList[index];
                return Card(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: BorderSide(color: Colors.grey.shade200, width: 1),
                  ),
                  child: ListTile(
                    minTileHeight: 60,
                    onTap: () {
                      providerR.playSong(index);
                      Navigator.pushNamed(
                        context,
                        AppRoutes.music,
                        arguments: providerW.musicList[index],
                      );
                    },
                    contentPadding: const EdgeInsets.all(12),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        song.musicImage ?? "",
                        fit: BoxFit.cover,
                        height: 60,
                        width: 50,
                      ),
                    ),
                    title: Text(
                      song.title ?? "Unknown Title",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                    subtitle: Text(
                      song.singerName ?? "Unknown Artist",
                      style: TextStyle(
                        color: Colors.grey.shade700,
                        fontSize: 12,
                      ),
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        providerW.isPlay && providerW.currentIndex == index
                            ? Icons.pause
                            : Icons.play_arrow,
                        color: Colors.greenAccent,
                      ),
                      onPressed: () {
                        if (providerW.isPlay &&
                            providerW.currentIndex == index) {
                          providerR.pauseSong();
                        } else {
                          providerR.playSong(index);
                        }
                      },
                    ),
                  ),
                );
              },
            ),
            const VideoScreen(),
          ],
        ),
      ),
    );
  }
}

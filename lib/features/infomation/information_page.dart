import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

// class InformationPage extends StatelessWidget {
//   const InformationPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: Center(child: Text("InformationPage"),),
//     );
//   }
// }

class InformationPage extends StatefulWidget {
  const InformationPage({super.key});

  @override
  State<InformationPage> createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  late FlickManager flickManager;

  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
      autoPlay: false,
        videoPlayerController: VideoPlayerController.networkUrl(Uri.parse(
            "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Show Video'), centerTitle: true),
      body: Center(
        child: AspectRatio(
          aspectRatio: 16/10,
          child: FlickVideoPlayer(flickManager: flickManager)),
      ),
    );
  }
}

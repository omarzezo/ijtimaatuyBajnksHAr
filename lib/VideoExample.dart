import 'package:chewie/chewie.dart';
import 'package:chewie/src/chewie_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

// void main() {
//   runApp(
//     ChewieDemo(),
//   );
// }

class VideoScreen extends StatefulWidget {
  String url;
  VideoScreen(this.url);


  @override
  State<StatefulWidget> createState() {
    return _ChewieDemoState();
  }
}

class _ChewieDemoState extends State<VideoScreen> {
  VideoPlayerController _videoPlayerController1;
  ChewieController _chewieController;

  @override
  void initState() {
    super.initState();

    _videoPlayerController1 = VideoPlayerController.network(widget.url);
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController1,
      aspectRatio: 3 / 2,
      autoPlay: true,
      looping: true,
      // Try playing around with some of these other options:

      // showControls: true,
      // materialProgressColors: ChewieProgressColors(
      //   playedColor: Colors.red,
      //   handleColor: Colors.blue,
      //   backgroundColor: Colors.grey,
      //   bufferedColor: Colors.lightGreen,
      // ),
      // placeholder: Container(
      //   color: Colors.grey,
      // ),
      // autoInitialize: true,
    );
  }

  @override
  void dispose() {
    _videoPlayerController1.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 420,
        width: MediaQuery.of(context).size.width,
        child: Chewie(
          controller: _chewieController,
        )
    );
  }
}
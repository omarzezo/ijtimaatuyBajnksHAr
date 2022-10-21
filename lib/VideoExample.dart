import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:chewie/src/chewie_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'Utils/CommonMethods.dart';

// void main() {
//   runApp(
//     ChewieDemo(),
//   );
// }

class VideoScreen extends StatefulWidget {
  String url;
  VideoScreen(this.url);
  // File url;
  // VideoScreen(this.url);

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
    hasNetwork().then((value) {
      if(value){
        createFileOfPdfUrl("0", widget.url).then((value) {
          if (this.mounted) {
            setState(() {
              _videoPlayerController1 = VideoPlayerController.file(value);

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
            });
          }
        });
      }else{
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
    });

  }

  @override
  void dispose() {
    if(_videoPlayerController1!=null&&_chewieController!=null) {
      _videoPlayerController1.dispose();
      _chewieController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 420,
        width: MediaQuery.of(context).size.width,
        child:_chewieController!=null? Chewie(
          controller: _chewieController,
        ):Container(
            width: 40,
            height: 40,
            child: Center(child: CircularProgressIndicator()))
    );
  }
}
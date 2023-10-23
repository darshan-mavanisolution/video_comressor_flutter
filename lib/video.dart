import 'dart:io';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
class BumbleBeeRemoteVideo extends StatefulWidget {
  final File videoFile;
  BumbleBeeRemoteVideo({
    required this.videoFile
});
  @override
  _BumbleBeeRemoteVideoState createState() => _BumbleBeeRemoteVideoState();
}

class _BumbleBeeRemoteVideoState extends State<BumbleBeeRemoteVideo> {
  late VideoPlayerController _controller;



  @override
  void initState() {
    super.initState();
    // VideoPlayerController.file(file)
    _controller = VideoPlayerController.file(
      widget.videoFile,

      videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
    );

    // _controller.addListener(() {
    //   setState(() {});
    // });
    _controller.setLooping(true);
    _controller.initialize().then((value) {
      setState(() {

      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Column(
        children: <Widget>[
          Container(padding: const EdgeInsets.only(top: 20.0)),
          const Text('With remote mp4'),
          Container(
            padding: const EdgeInsets.all(20),
            child:

            AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            ),
          ),
        ],
      ),
    );
  }
}
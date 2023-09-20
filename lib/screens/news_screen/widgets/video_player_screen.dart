






import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../../dashboard_screen/dashboard_controller.dart';

class VideoPlayerWidget extends StatefulWidget {

  final Uint8List videoBytes;

  const VideoPlayerWidget({Key? key, required this.videoBytes});

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  DashboardController dashboardController = Get.put(DashboardController());
   VideoPlayerController? controller;
   html.VideoElement? _videoElement;

  @override
  void initState() {
    super.initState();

    _videoElement = html.VideoElement();
    print(_videoElement!.currentSrc);
      initializeVideoPlayer();

    final blob = html.Blob([widget.videoBytes]);
    final url = html.Url.createObjectUrl(blob);
    _videoElement!.src = url;
  }

  @override
  void dispose() {
    controller!.dispose();
    _videoElement!.pause();
    _videoElement!.removeAttribute('src');
    html.Url.revokeObjectUrl(_videoElement!.src);
    super.dispose();
  }
  Future<void> initializeVideoPlayer() async {

    controller = VideoPlayerController.networkUrl(Uri.parse(_videoElement!.currentSrc));
    await controller!.initialize();
    await controller!.setLooping(true);

    controller!.play();
    controller!.addListener(() {controller.printError();});
   dashboardController.update(['dash']);
  }

  @override
  Widget build(BuildContext context) {
    if (controller != null &&controller!.value.isInitialized) {
      return AspectRatio(
        aspectRatio: controller!.value.aspectRatio,
        child: VideoPlayer(controller!),
      );
    } else {
      return Container();
    }
  }
}
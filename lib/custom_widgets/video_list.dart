import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideosList extends StatefulWidget {
  final VideoPlayerController videoPlayerController;
  final bool looping;

  const VideosList(
      {super.key, required this.videoPlayerController, required this.looping});

  @override
  State<VideosList> createState() => _VideosListState();
}

class _VideosListState extends State<VideosList> {
  late ChewieController videosController;

  @override
  void initState() {
    super.initState();

    videosController = ChewieController(
      startAt: Duration.zero,
      videoPlayerController: widget.videoPlayerController,
      aspectRatio: 16 / 16,
      autoInitialize: true,
      looping: widget.looping,
      errorBuilder: (context, errorMessage) {
        return progressBar();
      },
    );
  }

  Widget progressBar() {
    return const CircularProgressIndicator();
  }

  @override
  Widget build(BuildContext context) {
    return Chewie(
      controller: videosController,
    );
  }

  @override
  void dispose() {
    super.dispose();

    videosController.dispose();
  }
}

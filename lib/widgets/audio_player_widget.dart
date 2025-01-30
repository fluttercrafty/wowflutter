import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:wowflutter/logging/logger.dart';
import 'package:encrypt/encrypt.dart' as encrypt;

class AudioWidget extends StatefulWidget {
  const AudioWidget({
    required this.postRecord,
    super.key,
  });
  final String postRecord;
  @override
  State<AudioWidget> createState() => _WidgetSondState();
}

class _WidgetSondState extends State<AudioWidget> {
  bool isPlaying = false;
  final _player = AudioPlayer();
  double currentSliderValue = 20;

  Duration duration = Duration.zero;
  Duration postition = Duration.zero;
  @override
  void initState() {
    super.initState();
    bindPlayer();
  }

  bindPlayer() async {
    await _player.setUrl(widget.postRecord);
    duration = _player.duration!;
    setState(() {});
    _player.positionStream.listen((event) {
      Duration temp = event;
      postition = temp;
      setState(() {});
    });
  }

  playAction() {
    if (isPlaying) {
      setState(() {});
      _player.pause();
      isPlaying = false;
      TLoggerHelper.error(isPlaying.toString());
    } else {
      setState(() {});
      _player.play();
      isPlaying = true;
      TLoggerHelper.error(isPlaying.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
      child: Column(
        children: [
          Slider(
            value: postition.inSeconds.toDouble(),
            min: 0,
            max: duration.inSeconds.toDouble(),
            onChanged: (value) async {
              final seekPostintion = Duration(seconds: value.toInt());
              await _player.seek(seekPostintion);
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(foramtTime(postition)),
              IconButton(
                  onPressed: playAction,
                  iconSize: 58,
                  icon: Icon(
                    isPlaying
                        ? Icons.pause_circle_outline
                        : Icons.play_circle_outline,
                  )),
              Text(foramtTime(duration))
            ],
          ),
        ],
      ),
    );
  }

  String foramtTime(Duration value) {
    String twoDigit(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigit(value.inHours);
    final min = twoDigit(value.inMinutes.remainder(60));
    final sec = twoDigit(value.inSeconds.remainder(60));
    return [if (value.inHours > 0) hours, min, sec].join(':');
  }
}

class WidgetSondPostFile extends StatefulWidget {
  const WidgetSondPostFile({
    required this.postFile,
    super.key,
  });
  final String postFile;
  @override
  State<WidgetSondPostFile> createState() => _WidgetSondPostFileState();
}

class _WidgetSondPostFileState extends State<WidgetSondPostFile> {
  bool isPlaying = false;
  final _player = AudioPlayer();
  double currentSliderValue = 20;

  Duration duration = Duration.zero;
  Duration postition = Duration.zero;
  @override
  void initState() {
    super.initState();
    bindPlayer();
  }

  bindPlayer() async {
    await _player.setUrl(widget.postFile);
    duration = _player.duration!;
    setState(() {});
    _player.positionStream.listen((event) {
      Duration temp = event;
      postition = temp;
      setState(() {});
    });
  }

  playAction() {
    if (isPlaying) {
      setState(() {});
      _player.pause();
      isPlaying = false;
      TLoggerHelper.error(isPlaying.toString());
    } else {
      setState(() {});
      _player.play();
      isPlaying = true;
      TLoggerHelper.error(isPlaying.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: Column(
        children: [
          Slider(
            value: postition.inSeconds.toDouble(),
            min: 0,
            max: duration.inSeconds.toDouble(),
            onChanged: (value) async {
              final seekPostintion = Duration(seconds: value.toInt());
              await _player.seek(seekPostintion);
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(foramtTime(postition)),
              IconButton(
                  onPressed: playAction,
                  iconSize: 58,
                  icon: Icon(
                    isPlaying
                        ? Icons.pause_circle_outline
                        : Icons.play_circle_outline,
                  )),
              Text(foramtTime(duration))
            ],
          ),
        ],
      ),
    );
  }

  String foramtTime(Duration value) {
    String twoDigit(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigit(value.inHours);
    final min = twoDigit(value.inMinutes.remainder(60));
    final sec = twoDigit(value.inSeconds.remainder(60));
    return [if (value.inHours > 0) hours, min, sec].join(':');
  }
}

final ivs = [
  encrypt.IV.fromUtf8('4dQ2MzVub3xK5c9Q'),
  encrypt.IV.fromUtf8('41246de0f4894e0a'),
  encrypt.IV.fromUtf8('2ec7fc5317bacedb')
];

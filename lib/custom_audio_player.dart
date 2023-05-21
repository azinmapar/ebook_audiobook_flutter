import 'package:audioplayers/audioplayers.dart';
import 'package:ebook_audiobook_flutter/consts.dart';
import 'package:flutter/material.dart';
import 'app_colors.dart' as AppColors;

class CustomAudioPlayer extends StatefulWidget {
  final AudioPlayer customPlayer;
  final String audioUrl;
  const CustomAudioPlayer(
      {Key? key, required this.customPlayer, required this.audioUrl})
      : super(key: key);

  @override
  State<CustomAudioPlayer> createState() => _CustomAudioPlayerState();
}

enum Speed { fast, slow }

class _CustomAudioPlayerState extends State<CustomAudioPlayer> {
  Duration _duration = Duration();
  Duration _position = Duration();
  //final String path = 'audiosample.mp3';
  String path = '';
  bool isPlaying = false;
  bool isPaused = false;
  bool isRepeat = false;
  bool isShuffle = false;
  Speed speed = Speed.slow;
  Color repeatColor = AppColors.kAudioAssetsInactiveColor;
  Color shuffleColor = AppColors.kAudioAssetsInactiveColor;
  Color fastSpeedColor = AppColors.kAudioAssetsInactiveColor;
  Color slowSpeedColor = AppColors.kAudioAssetsActiveColor;

  final List<IconData> _icons = [
    Icons.play_circle_filled_rounded,
    Icons.pause_circle_filled_rounded,
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    path = widget.audioUrl;
    widget.customPlayer.onDurationChanged.listen((d) {
      setState(() {
        _duration = d;
      });
    });
    widget.customPlayer.onPositionChanged.listen((p) {
      setState(() {
        _position = p;
      });
    });
    //widget.customPlayer.setSourceAsset(path);
    widget.customPlayer.setSource(UrlSource(path));
    widget.customPlayer.onPlayerComplete.listen((event) {
      setState(() {
        _position = const Duration(seconds: 0);
        if (isRepeat) {
          isPlaying = true;
        } else {
          isPlaying = false;
        }
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    widget.customPlayer.dispose();
    super.dispose();
  }

  Widget playPauseButton() {
    return IconButton(
      padding: const EdgeInsets.only(bottom: 10.0),
      onPressed: () async {
        if (!isPlaying) {
          //await widget.customPlayer.play(AssetSource(path));
          await widget.customPlayer.play(UrlSource(path));
          setState(() {
            isPlaying = true;
          });
        } else {
          widget.customPlayer.pause();
          setState(() {
            isPlaying = false;
          });
        }
      },
      icon: !isPlaying
          ? Icon(
              _icons[0],
              size: k50IconSize,
              color: AppColors.kAudioAssetsActiveColor,
            )
          : Icon(
              _icons[1],
              size: k50IconSize,
              color: AppColors.kAudioAssetsActiveColor,
            ),
    );
  }

  Widget fastButton() {
    return TextButton(
      onPressed: () {
        widget.customPlayer.setPlaybackRate(2);
        speed = Speed.fast;
        fastSpeedColor = AppColors.kAudioAssetsActiveColor;
        slowSpeedColor = AppColors.kAudioAssetsInactiveColor;
      },
      child: Text(
        '2x',
        style: TextStyle(fontSize: k20FontSize, color: fastSpeedColor),
      ),
    );
  }

  Widget slowButton() {
    return TextButton(
      onPressed: () {
        widget.customPlayer.setPlaybackRate(1);
        speed = Speed.slow;
        slowSpeedColor = AppColors.kAudioAssetsActiveColor;
        fastSpeedColor = AppColors.kAudioAssetsInactiveColor;
      },
      child: Text(
        '1x',
        style: TextStyle(fontSize: k20FontSize, color: slowSpeedColor),
      ),
    );
  }

  Widget repeatButton() {
    return IconButton(
      onPressed: () {
        if (!isRepeat) {
          widget.customPlayer.setReleaseMode(ReleaseMode.loop);
          setState(() {
            isRepeat = true;
            repeatColor = AppColors.kAudioAssetsActiveColor;
          });
        } else {
          widget.customPlayer.setReleaseMode(ReleaseMode.release);
          repeatColor = AppColors.kAudioAssetsInactiveColor;
          isRepeat = false;
        }
      },
      icon: const Icon(Icons.repeat_one_rounded),
      iconSize: k25IconSize,
      color: repeatColor,
    );
  }

  Widget shuffleButton() {
    return IconButton(
      onPressed: () {
        if (!isShuffle) {
          setState(() {
            isShuffle = true;
            shuffleColor = AppColors.kAudioAssetsActiveColor;
          });
        } else {
          //widget.customPlayer.setReleaseMode(ReleaseMode.release);
          repeatColor = AppColors.kAudioAssetsInactiveColor;
        }
      },
      icon: const Icon(Icons.shuffle),
      iconSize: k25IconSize,
      color: shuffleColor,
    );
  }

  Widget assetButtons() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          shuffleButton(),
          slowButton(),
          playPauseButton(),
          fastButton(),
          repeatButton(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _position.toString().split('.')[0],
                  style: TextStyle(
                    fontSize: k15FontSize,
                  ),
                ),
                Text(
                  _duration.toString().split('.')[0],
                  style: TextStyle(
                    fontSize: k15FontSize,
                  ),
                ),
              ],
            ),
          ),
          slider(),
          assetButtons(),
        ],
      ),
    );
  }

  Widget slider() {
    return Slider(
        value: _position.inSeconds.toDouble(),
        activeColor: AppColors.kSliderActiveColor,
        inactiveColor: AppColors.kSliderInactiveColor,
        min: 0.0,
        max: _duration.inSeconds.toDouble(),
        onChanged: (double value) {
          setState(() {
            changeToSecond(value.toInt());
            value = value;
          });
        });
  }

  void changeToSecond(int second) {
    Duration newDuration = Duration(seconds: second);
    widget.customPlayer.seek(newDuration);
  }
}

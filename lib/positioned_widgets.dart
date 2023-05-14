import 'package:flutter/material.dart';
import 'app_colors.dart' as AppColors;
import 'consts.dart';

//extracted widgets which came from positioned from audio player pager

class TopBackgroundPositioned extends StatelessWidget {
  const TopBackgroundPositioned({
    super.key,
    required this.height,
    required this.color,
  });

  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      height: height,
      child: Container(
        color: color,
      ),
    );
  }
}

class AppBarPositioned extends StatelessWidget {
  const AppBarPositioned({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: TransparentAppBar(),
    );
  }
}

class TransparentAppBar extends StatelessWidget {
  const TransparentAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        onPressed: () {},
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
        ),
      ],
    );
  }
}

class AudioPlayerPositioned extends StatelessWidget {
  const AudioPlayerPositioned({
    super.key,
    required this.height,
    required this.color,
    required this.title,
    required this.creator,
  });

  final double height;
  final Color color;
  final String title;
  final String creator;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      top: kAudioPlayerTopDistance,
      height: height,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(40.0),
        ),
        child: Column(
          children: [
            SizedBox(
              height: kAudioPlayerSizedBoxHeight,
            ),
            //title
            Text(
              title,
              style: const TextStyle(
                fontFamily: 'Avenir',
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            //creator
            Text(
              creator,
              style: const TextStyle(
                fontSize: 15.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AudioCover extends StatelessWidget {
  const AudioCover({
    super.key,
    required this.imageAddress,
  });

  final String imageAddress;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: kAudioPlayerTopDistance - (kPlayingAudioCoverDimensions) / 2,
      left: kPlayingAudioCoverHorizontalPosition,
      right: kPlayingAudioCoverHorizontalPosition,
      height: kPlayingAudioCoverDimensions,
      //background og image
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.kAudioBluishBackground,
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(
              color: AppColors.kTabVarViewColor,
              width: kPlayingAudioCoverBorderWidth),
        ),
        //padding around cover image
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          //cover image
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(imageAddress),
                fit: BoxFit.fill,
              ),
              border: Border.all(
                color: AppColors.kTabVarViewColor,
                width: kPlayingAudioCoverCircularBorderWidth,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

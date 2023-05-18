import 'package:audioplayers/audioplayers.dart';
import 'package:ebook_audiobook_flutter/custom_audio_player.dart';
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
        onPressed: () {
          Navigator.of(context).pop();
        },
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
    required this.customPlayer,
    required this.audioUrl,
  });

  final double height;
  final Color color;
  final String title;
  final String creator;
  final AudioPlayer customPlayer;
  final String audioUrl;

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
            ),
            CustomAudioPlayer(
              customPlayer: customPlayer,
              audioUrl: audioUrl,
            ),
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

class AudioInformation extends StatelessWidget {
  final String language;
  final int pages;
  final int year;

  const AudioInformation({
    super.key,
    required this.language,
    required this.pages,
    required this.year,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0.0,
      left: 0.0,
      width: kAudioDetailWidth,
      height: kAudioPageInformationHeight,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              kItemDetailTitle,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ItemDetails(
                      detailText: language,
                      icon: Icons.language_rounded,
                      iconColor: Colors.blue,
                    ),
                    ItemDetails(
                        detailText: pages.toString(),
                        icon: Icons.book_outlined,
                        iconColor: Colors.red),
                    ItemDetails(
                      detailText: year.toString(),
                      icon: Icons.date_range_outlined,
                      iconColor: Colors.green,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemDetails extends StatelessWidget {
  const ItemDetails({
    super.key,
    required this.detailText,
    required this.icon,
    required this.iconColor,
  });

  final String detailText;
  final IconData icon;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
          size: 33.0,
        ),
        const SizedBox(
          width: 5.0,
        ),
        Text(
          detailText,
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}

class AudioDetailCoverImage extends StatelessWidget {
  const AudioDetailCoverImage({
    super.key,
    required this.cover,
  });

  final String cover;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0.0,
      width: kAudioDetailWidth,
      height: kAudioPageInformationHeight,
      bottom: 0.0,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            image: DecorationImage(
              image: AssetImage(cover),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}

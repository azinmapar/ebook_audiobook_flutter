import 'package:audioplayers/audioplayers.dart';
import 'package:ebook_audiobook_flutter/consts.dart';
import 'package:flutter/material.dart';
import 'app_colors.dart' as AppColors;
import 'positioned_widgets.dart';

class DetailAudioPage extends StatefulWidget {
  const DetailAudioPage({Key? key}) : super(key: key);

  @override
  State<DetailAudioPage> createState() => _DetailAudioPageState();
}

class _DetailAudioPageState extends State<DetailAudioPage> {
  late AudioPlayer customPlayer;

  @override
  void initState() {
    super.initState();
    customPlayer = AudioPlayer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kAudioBluishBackground,
      body: Stack(
        children: [
          //the blue background above the page
          TopBackgroundPositioned(
            height: kBlueBackgroundAudioPageHeight,
            color: AppColors.kAudioBlueBackground,
          ),
          //AppBar
          const AppBarPositioned(),
          //AudioPlayer
          AudioPlayerPositioned(
            height: kAudioPlayerHeight,
            color: AppColors.kAudioGreyBackground,
            title: 'THE WATER CURE',
            creator: 'Martin Hyatt',
            customPlayer: customPlayer,
          ),
          //Cover of currently playing audio
          const AudioCover(
            imageAddress: 'images/beloved.jpg',
          ),
        ],
      ),
    );
  }
}

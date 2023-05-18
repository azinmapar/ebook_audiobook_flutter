import 'package:audioplayers/audioplayers.dart';
import 'package:ebook_audiobook_flutter/consts.dart';
import 'package:flutter/material.dart';
import 'app_colors.dart' as AppColors;
import 'positioned_widgets.dart';

class DetailAudioPage extends StatefulWidget {
  final item;

  const DetailAudioPage({Key? key, required this.item}) : super(key: key);

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
            title: widget.item['title'],
            creator: widget.item['author'],
            customPlayer: customPlayer,
            //should be widget/item['link'] but we don't have a specific url for every item in our json so this is a default url
            audioUrl: kAudioUrl,
          ),
          //Cover of currently playing audio
          AudioCover(
            imageAddress: widget.item['imageLink'],
          ),

          AudioInformation(
            language: widget.item['language'],
            pages: widget.item['pages'],
            year: widget.item['year'],
          ),

          AudioDetailCoverImage(
            cover: widget.item['imageLink'],
          ),
        ],
      ),
    );
  }
}

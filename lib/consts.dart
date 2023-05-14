import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

//Titles
const String kFirstSliderTitle = 'Popular Books';
const List<String> kTabsTitles = ['New', 'Popular', 'Trending'];
const String kLoveTag = 'Love';
List<Widget> kTabs = [];
List<Widget> kLibraryItems = [];

//Size
const double kAppBarIconSize = 24.0;
const double kSliderTitleSize = 30.0;
const double kSliderHeight = 180.0;
const double kPlayingAudioCoverBorderWidth = 2;
const double kPlayingAudioCoverCircularBorderWidth = 5;

//Icons
const IconData kAppBarMenuIcon = CupertinoIcons.rectangle_grid_2x2_fill;
const IconData kAppBarSearchIcon = Icons.search;
const IconData kAppBarNotificationsIcon = Icons.notifications_active;

//Styles
const TextStyle kSliderTitlesStyle = TextStyle(
  fontSize: kSliderTitleSize,
);

//Height Percents
final double kScreenHeight = 100.h;
final double kScreenWidth = 100.w;
final double kBlueBackgroundAudioPageHeight = kScreenHeight * 0.3;
final double kAudioPlayerTopDistance = kScreenHeight * 0.25;
final double kAudioPlayerHeight = kScreenHeight * 0.36;
final double kAudioPlayerSizedBoxHeight = kScreenHeight * 0.1;
final double kPlayingAudioCoverDimensions = kScreenWidth * 0.3;
final double kPlayingAudioCoverHorizontalPosition =
    (kScreenWidth - kPlayingAudioCoverDimensions) / 2;

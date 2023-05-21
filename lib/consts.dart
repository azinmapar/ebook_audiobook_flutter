import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

//hardcoded
const String kAudioUrl =
    'https://www.learningcontainer.com/wp-content/uploads/2020/02/Kalimba.mp3';

//Titles
const String kFirstSliderTitle = 'Popular Books';
const List<String> kTabsTitles = ['New', 'Popular', 'Trending'];
const String kLoveTag = 'Love';
const String kItemDetailTitle = 'Book Details';
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
final double kAudioPageInformationHeight = kScreenHeight * 0.37;
final double kAudioDetailWidth = kScreenWidth / 2;
final double kResponsivePadding20Pixels = kScreenWidth * 0.05;
final double k30FontSize =
    SizerUtil.deviceType == DeviceType.mobile ? 30.0 : 40.0;
final double k15FontSize =
    SizerUtil.deviceType == DeviceType.mobile ? 15.0 : 25.0;
final double k20FontSize =
    SizerUtil.deviceType == DeviceType.mobile ? 20.0 : 30.0;
final double k50IconSize =
    SizerUtil.deviceType == DeviceType.mobile ? 50.0 : 60.0;
final double k33IconSize =
    SizerUtil.deviceType == DeviceType.mobile ? 33.0 : 43.0;
final double k25IconSize =
    SizerUtil.deviceType == DeviceType.mobile ? 25.0 : 35.0;

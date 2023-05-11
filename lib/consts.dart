import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

//Icons
const IconData kAppBarMenuIcon = CupertinoIcons.rectangle_grid_2x2_fill;
const IconData kAppBarSearchIcon = Icons.search;
const IconData kAppBarNotificationsIcon = Icons.notifications_active;

//Styles
const TextStyle kSliderTitlesStyle = TextStyle(
  fontSize: kSliderTitleSize,
);

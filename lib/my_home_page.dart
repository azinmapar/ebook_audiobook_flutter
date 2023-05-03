import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ebook_audiobook_flutter/app_colors.dart' as AppColors;
import 'package:ebook_audiobook_flutter/consts.dart';

import 'library_scroll_view.dart';
import 'app_colors.dart';
import 'custom_slider.dart';
import 'custom_tabs.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  List popularBooks = [];
  late ScrollController _scrollController;
  late TabController _tabController;

  void loadTabs() {
    setState(() {
      Color tabColor;
      for (int i = 0; i < kTabsTitles.length; i++) {
        if (kTabColors.length <= i) {
          tabColor = kExtraMenu;
        } else {
          tabColor = kTabColors[i];
        }

        kTabs.add(CustomTabs(title: kTabsTitles[i], color: tabColor));

        //TODO: Make a list for library list tiles and add to it as much as kTabs.length
      }
    });
  }

  void loadPopularBooks() {
    DefaultAssetBundle.of(context)
        .loadString('json/popularBooks.json')
        .then((s) {
      setState(() {
        popularBooks = json.decode(s);
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadTabs();
    _tabController = TabController(length: kTabs.length, vsync: this);
    _scrollController = ScrollController();

    loadPopularBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.kBackground,
      child: SafeArea(
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //AppBar Icons
              Container(
                margin: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Icon(
                      kAppBarMenuIcon,
                      size: kAppBarIconSize,
                      color: kAppBarIconsColor,
                    ),
                    Row(
                      children: const <Widget>[
                        Icon(
                          kAppBarSearchIcon,
                          size: kAppBarIconSize,
                          color: kAppBarIconsColor,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Icon(
                          kAppBarNotificationsIcon,
                          size: kAppBarIconSize,
                          color: kAppBarIconsColor,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              //Slider
              CustomSlider(
                slides: popularBooks,
                title: kFirstSliderTitle,
              ),
              //Library
              LibraryScrollView(
                scrollController: _scrollController,
                tabController: _tabController,
              )
            ],
          ),
        ),
      ),
    );
  }
}

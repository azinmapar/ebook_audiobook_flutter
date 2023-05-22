import 'dart:convert';

import 'package:ebook_audiobook_flutter/library_list.dart';
import 'package:flutter/material.dart';
import 'package:ebook_audiobook_flutter/app_colors.dart' as AppColors;
import 'package:ebook_audiobook_flutter/consts.dart';

import 'custom_search_delegate.dart';
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
  // [
  //  [tab, 1, item, list, ...],
  //  [tab, 2, item, list, ...],
  //  [tab, 3, item, list, ...]
  //  ...
  // ]
  late List items;
  late ScrollController _scrollController;
  late TabController _tabController;

  void loadLibrary() {
    setState(() {
      Color tabColor;
      for (int i = 0; i < kTabsTitles.length; i++) {
        //load tabs
        tabColor = kTabColors.length <= i ? kExtraMenu : kTabColors[i];

        kTabs.add(CustomTabs(title: kTabsTitles[i], color: tabColor));

        //load library items
        kLibraryItems.add(LibraryList(items: items[i]));
      }
    });
  }

  Future loadData() async {
    items = List.generate(kTabsTitles.length, (index) => [], growable: true);
    for (int i = 0; i < kTabsTitles.length; i++) {
      String tab = kTabsTitles[i];
      String jsonFileName = 'json/$tab.json';
      await DefaultAssetBundle.of(context).loadString(jsonFileName).then((s) {
        setState(() {
          items[i] = (json.decode(s));
        });
      });
    }
  }

  void fakeInnit() async {
    await loadData();
    loadLibrary();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fakeInnit();
  }

  @override
  Widget build(BuildContext context) {
    _tabController = TabController(length: kTabs.length, vsync: this);
    _scrollController = ScrollController();
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
                      children: <Widget>[
                        IconButton(
                          icon: const Icon(
                            kAppBarSearchIcon,
                            size: kAppBarIconSize,
                            color: kAppBarIconsColor,
                          ),
                          onPressed: () {
                            showSearch(
                              context: context,
                              delegate:
                                  CustomSearchDelegate(searchTerms: items),
                            );
                          },
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        const Icon(
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
                slides: items[1],
                title: kFirstSliderTitle,
              ),
              //Library
              LibraryScrollView(
                scrollController: _scrollController,
                tabController: _tabController,
                items: items,
              )
            ],
          ),
        ),
      ),
    );
  }
}

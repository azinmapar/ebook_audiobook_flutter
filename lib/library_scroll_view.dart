import 'package:flutter/material.dart';
import 'consts.dart';
import 'app_colors.dart';

class LibraryScrollView extends StatelessWidget {
  const LibraryScrollView({
    super.key,
    required ScrollController scrollController,
    required TabController tabController,
    required this.items,
  })  : _scrollController = scrollController,
        _tabController = tabController;

  final ScrollController _scrollController;
  final TabController _tabController;
  final List items;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (BuildContext context, bool isScroll) {
          return [
            //Library Top Bar
            SliverAppBar(
              backgroundColor: kSliverBackground,
              pinned: true, //not moving
              bottom: PreferredSize(
                //bar height
                preferredSize: const Size.fromHeight(50),
                child: Container(
                  margin: const EdgeInsets.only(bottom: 25.0, left: 7.0),
                  child: TabBar(
                    //when selected
                    indicatorPadding: const EdgeInsets.all(0),
                    indicatorSize: TabBarIndicatorSize.label,
                    labelPadding: const EdgeInsets.only(right: 10.0),
                    isScrollable: true,
                    controller: _tabController,
                    //shadow when selected
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          //blurring the shadow
                          blurRadius: 7,
                          //dimension
                          offset: const Offset(0, 0),
                        ),
                      ],
                    ),
                    tabs: kTabs,
                  ),
                ),
              ),
            ),
          ];
        },
        //Libraries
        body: TabBarView(
          controller: _tabController,
          children: kLibraryItems,
        ),
      ),
    );
  }
}

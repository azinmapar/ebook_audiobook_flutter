import 'package:flutter/material.dart';
import 'consts.dart';
import 'app_colors.dart';

class LibraryScrollView extends StatelessWidget {
  const LibraryScrollView({
    super.key,
    required ScrollController scrollController,
    required TabController tabController,
  })  : _scrollController = scrollController,
        _tabController = tabController;

  final ScrollController _scrollController;
  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (BuildContext context, bool isScroll) {
          return [
            //Library Bar
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
                        kBoxShadows,
                      ],
                    ),
                    tabs: kTabs,
                  ),
                ),
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: const [
            Material(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.grey,
                ),
                title: Text(
                  'Content',
                ),
              ),
            ),
            Material(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.grey,
                ),
                title: Text(
                  'Content',
                ),
              ),
            ),
            Material(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.grey,
                ),
                title: Text(
                  'Content',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

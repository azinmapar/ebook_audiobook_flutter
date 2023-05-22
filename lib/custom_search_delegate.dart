import 'package:ebook_audiobook_flutter/consts.dart';
import 'package:flutter/material.dart';
import 'app_colors.dart' as AppColor;
import 'detail_audio_page.dart';

class CustomSearchDelegate extends SearchDelegate {
  List searchTerms;

  CustomSearchDelegate({required this.searchTerms});

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List matchQuery = [];
    List matchSearch = [];
    for (int i = 0; i < searchTerms[0].length; i++) {
      var item = searchTerms[0][i]['title'];
      if (item.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
        matchSearch.add(searchTerms[0][i]);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        var searchResult = matchSearch[index];
        return Padding(
          padding: EdgeInsets.only(
              top: kResponsivePadding8Pixels,
              right: kResponsivePadding8Pixels,
              left: kResponsivePadding8Pixels),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: AppColor.kTabVarViewColor,
              boxShadow: [
                BoxShadow(
                  blurRadius: 2,
                  offset: const Offset(0, 0),
                  color: Colors.grey.withOpacity(0.6),
                ),
              ],
            ),
            child: ListTile(
              leading: CircleAvatar(
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(searchResult['imageLink']),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              title: Text(result),
              subtitle: Text(
                searchResult['author'],
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailAudioPage(
                              item: searchResult,
                            )));
              },
            ),
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List matchQuery = [];
    List matchSearch = [];

    for (int i = 0; i < searchTerms[0].length; i++) {
      var item = searchTerms[0][i]['title'];
      if (item.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
        matchSearch.add(searchTerms[0][i]);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        var searchResult = matchSearch[index];
        return Padding(
          padding: EdgeInsets.only(
              top: kResponsivePadding8Pixels,
              right: kResponsivePadding8Pixels,
              left: kResponsivePadding8Pixels),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: AppColor.kTabVarViewColor,
              boxShadow: [
                BoxShadow(
                  blurRadius: 2,
                  offset: const Offset(0, 0),
                  color: Colors.grey.withOpacity(0.6),
                ),
              ],
            ),
            child: ListTile(
              leading: CircleAvatar(
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(searchResult['imageLink']),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              title: Text(result),
              subtitle: Text(
                searchResult['author'],
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailAudioPage(
                              item: searchResult,
                            )));
              },
            ),
          ),
        );
      },
    );
  }
}

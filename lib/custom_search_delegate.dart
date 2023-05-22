import 'package:flutter/material.dart';

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
        return ListTile(
          title: Text(result),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailAudioPage(
                          item: searchResult,
                        )));
          },
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
        return ListTile(
          title: Text(result),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailAudioPage(
                          item: searchResult,
                        )));
          },
        );
      },
    );
  }
}

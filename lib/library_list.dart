import 'package:ebook_audiobook_flutter/detail_audio_page.dart';
import 'package:flutter/material.dart';
import 'consts.dart';
import 'app_colors.dart' as AppColor;

class LibraryList extends StatelessWidget {
  const LibraryList({Key? key, required this.items}) : super(key: key);

  final List items;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.isEmpty ? 0 : items.length,
      itemBuilder: (_, i) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailAudioPage(
                          item: items[i],
                        )));
          },
          child: Container(
            margin: const EdgeInsets.only(
                left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
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
              child: Container(
                padding: const EdgeInsets.all(8),
                //inside one item in list
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    //item image
                    Container(
                      width: 90,
                      height: 144,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                          image: AssetImage(items[i]['imageLink']),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    SizedBox(
                      height: 120.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          //published year and icon
                          Row(
                            children: [
                              //calender icon
                              const Icon(
                                Icons.date_range_rounded,
                                color: AppColor.kPagesColor,
                                size: 20.0,
                              ),
                              const SizedBox(
                                width: 5.0,
                              ),
                              //published year
                              Text(
                                items[i]['year'].toString(),
                                style: const TextStyle(
                                  color: AppColor.kPagesNumberColor,
                                ),
                              ),
                            ],
                          ),
                          //name of item, in sized box because without width it would overflow the screen
                          SizedBox(
                            width: 200.0,
                            child: Text(
                              items[i]['title'],
                              style: const TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Avenir',
                              ),
                            ),
                          ),
                          //author/creator of item
                          Text(
                            items[i]['author'],
                            style: const TextStyle(
                              fontSize: 13.0,
                              fontFamily: 'Avenir',
                              color: AppColor.kAuthorText,
                            ),
                          ),
                          //tag
                          Container(
                            width: 60.0,
                            height: 20.0,
                            decoration: BoxDecoration(
                              color: AppColor.kFavoriteColor,
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            alignment: Alignment.center,
                            //tag text
                            child: const Text(
                              kFavoriteTag,
                              style: TextStyle(
                                color: AppColor.kWhiteTagColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

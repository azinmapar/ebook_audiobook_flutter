import 'package:flutter/material.dart';
import 'consts.dart';

class CustomSlider extends StatelessWidget {
  const CustomSlider({
    super.key,
    required this.slides,
    required this.title,
  });

  //information of books in a list from json
  final List slides;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 10,
      ),
      child: Column(
        children: [
          //Title: Using Row to start the title in the beginning
          CustomSliderTitle(title: title),
          //Slider itself
          SizedBox(
            height: kSliderHeight,
            child: Stack(
              children: [
                //positioned to position slider at the beginning
                Positioned(
                  left: -40,
                  right: 0,
                  top: 0,
                  child: CustomSliderPageView(slides: slides),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomSliderPageView extends StatelessWidget {
  const CustomSliderPageView({
    super.key,
    required this.slides,
  });

  final List slides;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kSliderHeight,
      child: PageView.builder(
        //percent of occupation the screen should take
        controller: PageController(viewportFraction: 0.8),
        //number of slides (shows container in the builder)
        itemCount: slides.isEmpty ? 0 : slides.length,
        //i is the slides index
        itemBuilder: (_, i) {
          //what should be shown on slider
          return Container(
            margin: const EdgeInsets.only(right: 10.0, top: 16.0),
            height: kSliderHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              image: DecorationImage(
                //extracting image of the book or ... from slides list information
                image: AssetImage(slides[i]['imageLink']),
                fit: BoxFit.fitWidth,
              ),
            ),
          );
        },
      ),
    );
  }
}

class CustomSliderTitle extends StatelessWidget {
  const CustomSliderTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: kSliderTitlesStyle,
        ),
      ],
    );
  }
}

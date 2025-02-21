import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies/core/utility/constants/images.dart';

import 'available_now_item.dart';

class AvailableNowList extends StatelessWidget {
  AvailableNowList({
    super.key,
  });
  List<String> list = [
    KImages.movie1971,
    KImages.movieCaptain,
    KImages.movieBaby,
  ];
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.only(top: height * .16),
          child: CarouselSlider(
            options: CarouselOptions(
              height: height * .36,
              viewportFraction: .5,
              initialPage: 0,
              disableCenter: true,
              enableInfiniteScroll: true,
              enlargeCenterPage: true,
              enlargeFactor: .35,
              scrollDirection: Axis.horizontal,
            ),
            items: list.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return AvailableNowItem(
                    image: i,
                  );
                },
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies/core/utility/constants/colors.dart';
import 'package:movies/core/utility/constants/images.dart';

class CategoryScrollItem extends StatelessWidget {
  CategoryScrollItem({
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
                  return Stack(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(24)),
                          child: Image.asset(i,
                            fit: BoxFit.fill,
                          )),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 3, vertical: 1),
                        margin:
                            EdgeInsets.symmetric(horizontal: 9, vertical: 11),
                        decoration: BoxDecoration(
                            color: Color(0xFF282A28).withValues(alpha: .8),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '7.7',
                              style: TextStyle(color: Colors.white),
                            ),
                            Icon(
                              Icons.star_rounded,
                              color: AppColors.kPrimaryColor,
                            )
                          ],
                        ),
                      )
                    ],
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

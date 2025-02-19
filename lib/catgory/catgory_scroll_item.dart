import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CatgoryScrollItem extends StatelessWidget {
   CatgoryScrollItem({required this.list,required this.width,required this.hight,super.key});
  List<String> list ;
  var hight;
    var width ;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 120),
          child: CarouselSlider(
            options: CarouselOptions(
              height: 320,
              aspectRatio: 2.0,
              viewportFraction: .4,
              initialPage: 0,
              disableCenter: true,
              enableInfiniteScroll: true,
              enlargeCenterPage: true,
              enlargeFactor: 0.4,
              scrollDirection: Axis.horizontal,
            ),
            items: list.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Stack(
                    children: [
                      Container(
                        height: hight,
                        width: width ,
                        child: ClipRRect(
                            borderRadius:
                            BorderRadius.all(Radius.circular(24)),
                            child: Image.asset(
                              i,
                              fit: BoxFit.cover,
                            )),
                      ),
                      Container(alignment: Alignment.center,
                        height: 30,
                        width: 60,

                        decoration: BoxDecoration(
                          color: Colors.black45,
                          borderRadius: BorderRadius.circular(16)
                        ),
                        child: Text('7.7',style: TextStyle(color: Colors.white),),
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

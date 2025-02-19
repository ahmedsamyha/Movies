import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movies/catgory/catgory_scroll_item.dart';
import 'package:movies/core/utility/constants/colors.dart';
import 'package:movies/core/utility/constants/images.dart';
import 'package:movies/core/utility/theme_data/custom_theme/text_theme.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  List<String> list = [
    KImages.boarding1,
    KImages.boarding2,
    KImages.boarding3,
    KImages.boarding4,
    KImages.boarding5,
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        SizedBox(
          height: height * .75,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Stack(children: [
                  Image.asset(
                    KImages.boarding5,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [Colors.black, Colors.black12])),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Image.asset(KImages.availabel),
                      SizedBox(
                        height: 300,
                      ),
                      Image.asset(KImages.watch),
                    ],
                  ),
                  CatgoryScrollItem(
                    list: list,
                    hight: height * .6,
                    width: width * .4,
                  )
                ]),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Text('Action',
              style: KStyles.roboto14w400White,),
              Spacer(
                flex: 1,
              ),
              Text('See More',
              style: KStyles.roboto14w400Primary,),
              Icon(Icons.arrow_forward,
              color: AppColors.kPrimaryColor,)
            ],
          ),
        ),
        SizedBox(height: 6,),
        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return SizedBox(
                width: 30,
              );
            },
            itemCount: list.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return SizedBox(
                width: width * .3,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: Image.asset(
                      list[index],
                      fit: BoxFit.cover,
                    )),
              );
            },
          ),
        )
      ],
    );
  }
}

/*Column(
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
                  return Container(
                    width: width * .4,
                    child: ClipRRect(
                        borderRadius:
                        BorderRadius.all(Radius.circular(24)),
                        child: Image.asset(
                          i,
                          fit: BoxFit.cover,
                        )),
                  );
                },
              );
            }).toList(),
          ),
        ),
      ],
    );*/

/*Expanded(
          child: ListView.separated(
            separatorBuilder:(context,index){
              return SizedBox(width: 24,);
            },
            itemCount: list.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context,index){
              return SizedBox(

                width: width*.4,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: Image.asset(list[index],
                      fit: BoxFit.cover,)
                ),
              );
            },
          ),
        )*/
/* Padding(
                padding: const EdgeInsets.only(bottom: 140),
                child: SizedBox(
                  height: 300,
                  child: ListView.separated(
                    separatorBuilder:(context,index){
                      return SizedBox(width: 24,);
                    },
                    itemCount: list.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index){
                      return SizedBox(

                        width: width*.4,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(24),
                          child: Image.asset(list[index],
                          fit: BoxFit.cover,)
                        ),
                      );
                    },
                  ),
                ),
              )*/
/*  CarouselSlider(
  options: CarouselOptions(
    height: 390,
    aspectRatio: 2.0,
    viewportFraction: 0.4,
    initialPage: 0,
    enableInfiniteScroll: true,
    enlargeCenterPage: true,
    enlargeFactor: 0.4,
    scrollDirection: Axis.horizontal,
  ),
  items: list.map((imagePath) {
    return Builder(
      builder: (BuildContext context) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(24), // جعل الحواف منحنية للجميع
          child: Image.asset(imagePath, fit: BoxFit.cover),
        );
      },
    );
  }).toList(),
)
*/

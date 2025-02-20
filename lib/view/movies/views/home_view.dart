import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movies/view/movies/widgets/catgory_scroll_item.dart';
import 'package:movies/core/utility/constants/colors.dart';
import 'package:movies/core/utility/constants/images.dart';
import 'package:movies/core/utility/theme_data/custom_theme/text_theme.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  List<String> actionList = [
    KImages.movie1971,
    KImages.movieCaptain,
    KImages.movieBaby,
    KImages.movie1971,
    KImages.movieCaptain,
    KImages.movieBaby,
  ];
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(children: [
        Container(
          height: height * .67,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage(
              KImages.movie1971,
            ),
            fit: BoxFit.fill,
          )),
          child: Stack(
            children: [
              Image.asset(
                KImages.gradiantColors,
                fit: BoxFit.fill,
                width: double.infinity,
                height: height * .7,
              ),
              Positioned(
                  top: 38,
                  left: width * .15,
                  child: Image.asset(KImages.availabel)),
              CategoryScrollItem(),
              Positioned(
                  bottom: 0,
                  left: width * .01,
                  right: width * .01,
                  child: Image.asset(KImages.watch)),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Text(
                "action".tr(),
                style: KStyles.roboto20w400White,
              ),
              Spacer(
                flex: 1,
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "see_more".tr(),
                    style: KStyles.roboto16w400Primary,
                  )),
              Icon(
                Icons.arrow_forward,
                color: AppColors.kPrimaryColor,
              ),
            ],
          ),
        ),
        SizedBox(
          height: height * .28,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView.separated(
              physics: BouncingScrollPhysics(),
              separatorBuilder: (context, index) {
                return SizedBox(
                  width: 16,
                );
              },
              itemCount: actionList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Stack(
                  children: [

                    ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: Image.asset(
                          actionList[index],
                          fit: BoxFit.fill,
                          width: width * .35,
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
                    ),
                  ],
                );
              },
            ),
          ),
        )
      ]),
    );
  }
}

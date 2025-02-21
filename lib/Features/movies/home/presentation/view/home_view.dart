import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movies/Features/movies/home/presentation/widgets/available_now_list.dart';
import 'package:movies/core/utility/constants/colors.dart';
import 'package:movies/core/utility/constants/images.dart';
import 'package:movies/core/utility/theme_data/custom_theme/text_theme.dart';

import '../widgets/action_list_view.dart';

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
      child: Column(
          children: [
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
              AvailableNowList(),
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
        ActionListView()
      ]),
    );
  }
}





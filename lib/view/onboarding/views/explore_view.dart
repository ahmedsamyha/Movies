import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:movies/core/utility/constants/images.dart';
import 'package:movies/core/utility/theme_data/custom_theme/text_theme.dart';
import 'package:movies/view/onboarding/views/on_boarding_view1.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(KImages.explore), fit: BoxFit.fill)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "explore_title".tr(),
                    style: KStyles.inter36w500White,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    "explore_body".tr(),
                    style: KStyles.inter20w400Gray,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (context) => OnBoardingView1()),
                                  (route) => false,
                            );
                          },
                          child: Text(
                            "explore_now".tr(),
                            style: KStyles.inter20w600Black,
                          )))
                ],
              ),
            ),
          )),
    );
  }
}

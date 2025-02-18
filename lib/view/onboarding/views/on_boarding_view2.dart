import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:movies/core/utility/constants/images.dart';
import 'package:movies/view/onboarding/widgets/custom_onboarding_bottom_widget.dart';

import 'on_boarding_view3.dart';


class OnBoardingView2 extends StatelessWidget {
  const OnBoardingView2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(KImages.boarding2), fit: BoxFit.fill)),
          child: CustomOnBoardingBottomWidget(
            title: "boarding2_title".tr(),
            content:
            "boarding2_body".tr(),
            btnText: "next".tr(),
            isActiveBack: true,
            onNextPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OnBoardingView3()),
              );
            },
            onBackPressed: () {
             Navigator.pop(context);
            },
          )),
    );
  }
}

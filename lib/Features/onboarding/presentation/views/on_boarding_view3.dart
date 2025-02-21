import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movies/Features/onboarding/presentation/widgets/custom_onboarding_bottom_widget.dart';

import 'package:movies/core/utility/constants/images.dart';

import 'on_boarding_view4.dart';



class OnBoardingView3 extends StatelessWidget {
  const OnBoardingView3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(KImages.boarding3), fit: BoxFit.fill)),
          child: CustomOnBoardingBottomWidget(
            title: "boarding3_title".tr(),
            content:
            "boarding3_body".tr(),
            btnText: "next".tr(),

            isActiveBack: true,
            onNextPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OnBoardingView4()),
              );
            },
            onBackPressed: () {
              Navigator.pop(context);
            },
          )),
    );
  }
}

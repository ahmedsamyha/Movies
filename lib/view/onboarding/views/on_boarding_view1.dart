import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:movies/core/utility/constants/images.dart';
import '../widgets/custom_onboarding_bottom_widget.dart';
import 'on_boarding_view2.dart';

class OnBoardingView1 extends StatelessWidget {
  const OnBoardingView1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(KImages.boarding1), fit: BoxFit.fill)),
          child: CustomOnBoardingBottomWidget(
            title: "boarding1_title".tr(),
            content:
            "boarding1_body".tr(),
            btnText: "next".tr(),
            isActiveBack: false,
            onNextPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OnBoardingView2()),
              );
            },
          )),
    );
  }
}

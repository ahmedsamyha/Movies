import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movies/core/utility/constants/images.dart';

import '../widgets/custom_onboarding_bottom_widget.dart';
import 'on_boarding_view5.dart';


class OnBoardingView4 extends StatelessWidget {
  const OnBoardingView4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(KImages.boarding4), fit: BoxFit.fill)),
          child: CustomOnBoardingBottomWidget(
            title: "boarding4_title".tr(),
            content:
            "boarding4_body".tr(),
            btnText: "next".tr(),
            isActiveBack: true,
            onNextPressed: (){
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) => OnBoardingView5(),
                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                    const begin = Offset(1.0, 0.0); // Start from right
                    const end = Offset.zero;
                    const curve = Curves.easeInOut;

                    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                    var offsetAnimation = animation.drive(tween);

                    return SlideTransition(position: offsetAnimation, child: child);
                  },
                ),
              );

            },
            onBackPressed: () {
             Navigator.pop(context);
            },
          )),
    );
  }
}

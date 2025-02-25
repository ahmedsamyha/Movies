import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movies/Features/aouth/presentation/views/login_view.dart';
import 'package:movies/Features/onboarding/presentation/widgets/custom_onboarding_bottom_widget.dart';
import 'package:movies/core/utility/constants/images.dart';


class OnBoardingView5 extends StatelessWidget {
  const OnBoardingView5({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(KImages.boarding5), fit: BoxFit.fill)),
          child: CustomOnBoardingBottomWidget(
            title: "boarding5_title".tr(),
            btnText: "finish".tr(),
            isActiveBack: true,
            content: '',
            onNextPressed: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) => LoginView(),
                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                    var fadeAnimation = Tween<double>(begin: 0.0, end: 1.0)
                        .chain(CurveTween(curve: Curves.easeInOut))
                        .animate(animation);

                    var slideAnimation = Tween<Offset>(begin: Offset(1.0, 0.0), end: Offset.zero)
                        .chain(CurveTween(curve: Curves.easeInOut))
                        .animate(animation);

                    return FadeTransition(
                      opacity: fadeAnimation,
                      child: SlideTransition(position: slideAnimation, child: child),
                    );
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

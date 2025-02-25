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
              Navigator.pushAndRemoveUntil(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) => LoginView(),
                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                    const begin = Offset(1.0, 0.0);
                    const end = Offset.zero;
                    const curve = Curves.easeInOut;

                    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                    var offsetAnimation = animation.drive(tween);

                    return SlideTransition(position: offsetAnimation, child: child);
                  },
                ),
                    (route) => false,
              );

            },
            onBackPressed: () {
              Navigator.pop(context);
            },
          )),
    );
  }
}

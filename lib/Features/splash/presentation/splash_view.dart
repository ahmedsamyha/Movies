import 'package:flutter/material.dart';
import 'package:movies/Features/onboarding/presentation/views/explore_view.dart';
import 'package:movies/core/utility/constants/images.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushAndRemoveUntil(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => ExploreView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
        (route) => false,
      );

    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(0), child: AppBar()),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: height * .35,
            ),
            Center(
              child: SizedBox(
                  height: width * .24,
                  width: width * .24,
                  child: Image(
                    image: AssetImage(KImages.logo),
                    fit: BoxFit.fill,
                  )),
            ),
            SizedBox(
              height: height * .38,
            ),
            Image(
              image: AssetImage(KImages.route),
            ),
            Image(
              image: AssetImage(KImages.nabil),
            ),
            const SizedBox(
              height: 4,
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:movies/core/utility/constants/colors.dart';
import 'package:movies/core/utility/constants/images.dart';
import 'package:shimmer/shimmer.dart';

class AvailableNowShimmer extends StatelessWidget {
  const AvailableNowShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: height * .67,
      width: double.infinity,
      child: Stack(
        children: [
          Positioned.fill(
              child: Image.asset(KImages.logo)
          ),
          Positioned(
              top: 37,
              left: width * .15,
              child: Image.asset(KImages.availabel)),
          Padding(
            padding: EdgeInsets.only(top: height * .18,left: width*.24 ,right: width*.24),
            child: SizedBox(
              height: height * .33,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Shimmer.fromColors(
                  baseColor: Colors.white.withValues(alpha: 0.01),
                  highlightColor: Colors.white.withValues(alpha: 0.1),
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.darkBackground,
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              left: width * .01,
              right: width * .01,
              child: Image.asset(KImages.watch)),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/utility/constants/colors.dart';

class ActionShimmer extends StatelessWidget {
  const ActionShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return SizedBox(
      height: height * .28,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: 6,
          separatorBuilder: (context, index) {
            return const SizedBox(width: 16);
          },
          itemBuilder: (context, index) {
            return Shimmer.fromColors(
              baseColor: Colors.white.withValues(alpha: 0.04),
              highlightColor: Colors.white.withValues(alpha: 0.1),
              child: Container(
                width: width * 0.4,
                height: height * 0.28,
                decoration: BoxDecoration(
                  color: AppColors.darkBackground,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

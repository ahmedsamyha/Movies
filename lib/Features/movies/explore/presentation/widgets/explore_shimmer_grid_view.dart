import 'package:flutter/material.dart';
import 'package:movies/core/utility/constants/colors.dart';
import 'package:shimmer/shimmer.dart';

class ExploreShimmerGridView extends StatelessWidget {
  const ExploreShimmerGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.only(top: 16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.65,
        crossAxisSpacing: 16,
        mainAxisSpacing: 8,
      ),
      itemCount: 6, // Show shimmer for 6 items
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(16),

          child: Shimmer.fromColors(
            baseColor: Colors.white.withOpacity(.2),
            highlightColor: Colors.white.withOpacity(.3),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.darkBackground,
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
        );
      },
    );
  }
}

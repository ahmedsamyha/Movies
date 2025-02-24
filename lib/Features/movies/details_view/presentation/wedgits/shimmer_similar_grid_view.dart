import 'package:flutter/material.dart';
import 'package:movies/core/utility/constants/colors.dart';
import 'package:shimmer/shimmer.dart';

class SimilarShimmerGridView extends StatelessWidget {
  const SimilarShimmerGridView({super.key});

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
      itemCount: 4,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
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

import 'package:flutter/material.dart';
import 'package:movies/core/utility/constants/colors.dart';
import 'package:shimmer/shimmer.dart';

class SearchShimmerGridView extends StatelessWidget {
  const SearchShimmerGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        padding: const EdgeInsets.only(top: 16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.65,
          crossAxisSpacing: 16,
          mainAxisSpacing: 8,
        ),
        itemCount: 6,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(16),
      
            child: Shimmer.fromColors(
              baseColor: Colors.white.withValues(alpha: 0.2),
              highlightColor: Colors.white.withValues(alpha: 0.3),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.darkBackground,
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

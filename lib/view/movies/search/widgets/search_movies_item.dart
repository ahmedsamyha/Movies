import 'package:flutter/material.dart';
import 'package:movies/core/utility/constants/colors.dart';

class SearchMoviesItem extends StatelessWidget {
  const SearchMoviesItem({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(24)),
            child: Image.asset(image,
              fit: BoxFit.fill,
            )),
        Container(
          padding:
          EdgeInsets.symmetric(horizontal: 3, vertical: 1),
          margin:
          EdgeInsets.symmetric(horizontal: 9, vertical: 11),
          decoration: BoxDecoration(
              color: Color(0xFF282A28).withValues(alpha: .8),
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '7.7',
                style: TextStyle(color: Colors.white),
              ),
              Icon(
                Icons.star_rounded,
                color: AppColors.kPrimaryColor,
              )
            ],
          ),
        )
      ],
    );
  }
}
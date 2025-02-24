import 'package:flutter/material.dart';
import 'package:movies/core/utility/constants/colors.dart';

class PhotoStarsItem extends StatelessWidget {
  const PhotoStarsItem({required this.photo,super.key});
  final String photo;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(24)),
            child: Image.asset(photo,
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

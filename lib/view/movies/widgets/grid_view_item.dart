import 'package:flutter/material.dart';
import 'package:movies/core/utility/constants/colors.dart';
import 'package:movies/view/movies/widgets/photo_stars_item.dart';

class GridViewItem extends StatelessWidget {
  const GridViewItem({required this.list,super.key});

  final  list;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.65,
            crossAxisSpacing: 16,
            mainAxisSpacing: 8),
        itemCount: list.length,
        itemBuilder: (context,index){
          return PhotoStarsItem(photo:list[index] ,);
        },
      ),
    );
  }
}

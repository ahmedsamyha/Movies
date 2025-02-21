import 'package:flutter/material.dart';
import 'package:movies/Features/movies/search/presentation/widgets/search_movies_item.dart';
import 'package:movies/core/utility/constants/images.dart';

class SearchGridView extends StatelessWidget {
  const SearchGridView({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    List<String> list = [
      KImages.movie1971,
      KImages.movieCaptain,
      KImages.movie1971,
      KImages.movieBaby,
    ];
    return Expanded(
      child: GridView.builder(
        padding: EdgeInsets.only(top: 16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.65,
            crossAxisSpacing: 16,
            mainAxisSpacing: 8),
        itemCount: list.length,
        itemBuilder: (context,index){
          return SearchMoviesItem(image: list[index],);
        },
      ),
    );
  }
}

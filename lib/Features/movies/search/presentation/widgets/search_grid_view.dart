import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/Features/movies/details_view/presentation/view/details_view.dart';
import 'package:movies/Features/movies/search/data/data_source/search_cubit/search_cubit.dart';
import 'package:movies/Features/movies/search/data/data_source/search_cubit/search_state.dart';
import 'package:movies/Features/movies/search/presentation/widgets/search_movies_item.dart';
import 'package:movies/Features/movies/search/presentation/widgets/search_shimmer_grid_view.dart';

class SearchGridView extends StatefulWidget {
  const SearchGridView({
    super.key,
  });

  @override
  State<SearchGridView> createState() => _SearchGridViewState();
}

class _SearchGridViewState extends State<SearchGridView> {
  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocBuilder<SearchCubit, SearchStates>(
      builder: (context, state) {
        var cubit = BlocProvider.of<SearchCubit>(context);
        if (cubit.searchList.isEmpty) {
          return Padding(
            padding: EdgeInsets.only(top: height * .27),
            child: Image.asset('assets/images/searchIsEmpty.png'),
          ) ;
        }else if (state is GetSearchLoadingState){
          return SearchShimmerGridView();
        }
        return Expanded(
          child: GridView.builder(
            padding: EdgeInsets.only(top: 16),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.65,
                crossAxisSpacing: 16,
                mainAxisSpacing: 8),
            itemCount: cubit.searchList.length,
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsView(movieModel: cubit.searchList[index],)));
                  },
                  child: SearchMoviesItem(movieModel: cubit.searchList[index],));
            },
          ),
        );
      },
    );
  }
}

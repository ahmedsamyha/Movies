import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/Features/movies/details_view/presentation/view/details_view.dart';
import 'package:movies/Features/movies/home/data/data_source/home_cubit/home_cubit.dart';
import 'package:movies/Features/movies/home/data/data_source/home_cubit/home_state.dart';
import 'package:movies/Features/movies/home/presentation/widgets/available_now_shimmer.dart';
import 'package:movies/core/utility/constants/images.dart';
import 'available_now_item.dart';

class AvailableNowList extends StatefulWidget {
  const AvailableNowList({
    super.key,
  });

  @override
  State<AvailableNowList> createState() => _AvailableNowListState();
}

class _AvailableNowListState extends State<AvailableNowList> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (context, state) {
        var cubit = BlocProvider.of<HomeCubit>(context);
        if (cubit.availableMoviesList.isEmpty ||
            state is GetAvailableLoadingState) {
          return AvailableNowShimmer();
        }
        return Container(
          height: height * .67,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: NetworkImage(
              cubit.availableMoviesList[cubit.currentIndex].mediumCoverImage ??
                  'https://img.yts.mx/assets/images/movies/mahogany_2022/medium-cover.jpg',
            ),
            fit: BoxFit.fill,
          )),
          child: Stack(
            children: [
              Positioned(
                  top: 38,
                  left: width * .15,
                  child: Image.asset(KImages.availabel)),
              Padding(
                padding: EdgeInsets.only(top: height * .15),
                child: SizedBox(
                  height: height * .36,
                  child: Swiper(
                    itemBuilder: (context, index) {
                      cubit.currentIndex = index;
                      return InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsView(movieModel: cubit.availableMoviesList[index],)));
                        },
                        child: AvailableNowItem(
                            movieModel: cubit.availableMoviesList[index]),
                      );
                    },
                    onIndexChanged: (index) {
                      setState(() {});
                    },
                    itemCount: cubit.availableMoviesList.length,
                    physics: const BouncingScrollPhysics(),
                    loop: false,
                    viewportFraction: .5,
                    scale: .64,
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
      },
    );
  }
}

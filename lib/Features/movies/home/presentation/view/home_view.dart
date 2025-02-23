import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/Features/movies/home/data/data_source/home_cubit/home_cubit.dart';
import 'package:movies/Features/movies/home/data/data_source/home_cubit/home_state.dart';
import 'package:movies/Features/movies/home/presentation/widgets/available_now_list.dart';
import 'package:movies/core/utility/constants/colors.dart';
import 'package:movies/core/utility/theme_data/custom_theme/text_theme.dart';
import '../../../../../core/utility/helper/network/dio_heper.dart';
import '../widgets/action_list_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) =>
          HomeCubit(GetAvailableInitialState(), ApiService(dio: Dio()))
            ..getAvailableMovies()
            ..getActionMovies(),
      child: SingleChildScrollView(
        child: Column(children: [
          AvailableNowList(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Text(
                  "action".tr(),
                  style: KStyles.roboto20w400White,
                ),
                Spacer(
                  flex: 1,
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "see_more".tr(),
                      style: KStyles.roboto16w400Primary,
                    )),
                Icon(
                  Icons.arrow_forward,
                  color: AppColors.kPrimaryColor,
                ),
              ],
            ),
          ),
          ActionListView()
        ]),
      ),
    );
  }
}

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/Features/aouth/presentation/widgets/custom_text_form_field.dart';
import 'package:movies/Features/movies/search/data/data_source/search_cubit/search_cubit.dart';
import 'package:movies/Features/movies/search/data/data_source/search_cubit/search_state.dart';
import 'package:movies/Features/movies/search/presentation/widgets/search_grid_view.dart';
import 'package:movies/core/utility/helper/network/dio_heper.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final TextEditingController searching = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(GetSearchInitialState(), ApiService(dio: Dio())),
      child: BlocBuilder<SearchCubit, SearchStates>(
        builder: (context, state) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomTextFormField(
                    prefixIcon: Icons.search_sharp,
                    label: "search".tr(),
                    controller: searching,
                    validator: (value) {
                      return null;
                    },
                    onChanged: (value) {
                      context.read<SearchCubit>().getSearchMovies(title: value);
                    },
                    keyboardType: TextInputType.text,
                    obscureText: false,
                  ),
                  SearchGridView(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}


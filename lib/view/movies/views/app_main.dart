import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:movies/core/utility/constants/colors.dart';
import 'package:movies/core/utility/constants/images.dart';
import 'package:movies/view/movies/views/explore_movies_view.dart';
import 'package:movies/view/movies/views/home_view.dart';
import 'package:movies/view/movies/views/profile_view.dart';
import 'package:movies/view/movies/views/search_view.dart';
import 'package:movies/view_model/app_main_cubit/app_main_cubit.dart';

class AppMainView extends StatefulWidget {
  const AppMainView({super.key});

  @override
  State<AppMainView> createState() => _AppMainViewState();
}

class _AppMainViewState extends State<AppMainView> {

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var appCubit = BlocProvider.of<AppMainCubit>(context);
    return Scaffold(

        body: Stack(
            children: [
              appCubit.screens[appCubit.currentIndex],
              Positioned(
                bottom: 8,
                left: 8,
                right: 8,
                child: SizedBox(
                  width: width,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: SizedBox(
                      height: 60,
                      child: BottomNavigationBar(
                        backgroundColor: AppColors.grayBackground,
                        selectedItemColor: AppColors.kPrimaryColor,
                        unselectedItemColor: AppColors.textWhiteColor,
                        type: BottomNavigationBarType.fixed,
                        currentIndex: appCubit.currentIndex,
                        showUnselectedLabels: false,
                        showSelectedLabels: false,
                        onTap: (value) {
                          appCubit.currentIndex = value;
                          setState(() {});
                        },
                        items: [
                          BottomNavigationBarItem(
                              icon: Icon(Iconsax.home_15),
                              label: ''),
                          BottomNavigationBarItem(
                              icon:  Icon(Iconsax.search_normal_15),
                              label: ''),
                          BottomNavigationBarItem(
                              icon: Icon(Icons.explore),
                              label: ''),
                          BottomNavigationBarItem(
                              icon:  Icon(Iconsax.profile_circle),
                              label: ''),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
            ),
        );
    }
}

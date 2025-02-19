import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies/core/utility/constants/colors.dart';
import 'package:movies/core/utility/constants/images.dart';
import 'package:movies/view/movies/views/explore_movies_view.dart';
import 'package:movies/view/movies/views/home_view.dart';
import 'package:movies/view/movies/views/profile_view.dart';
import 'package:movies/view/movies/views/search_view.dart';

class AppMainView extends StatefulWidget {
  const AppMainView({super.key});

  @override
  State<AppMainView> createState() => _AppMainViewState();
}

class _AppMainViewState extends State<AppMainView> {
  int currentIndex = 0;
  List<Widget> screens = [
    HomeView(),
    SearchView(),
    ExploreMoviesView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(0),
          child: AppBar(
            systemOverlayStyle:
            SystemUiOverlayStyle(statusBarColor: AppColors.darkBackground),
          ),
        ),
        body: Stack(
            children: [
              screens[currentIndex],
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
                        currentIndex: currentIndex,
                        showUnselectedLabels: false,
                        showSelectedLabels: false,
                        onTap: (value) {
                          currentIndex = value;
                          setState(() {});
                        },
                        items: [
                          BottomNavigationBarItem(
                              icon: ImageIcon(AssetImage(KImages.homeIcon)),
                              label: ''),
                          BottomNavigationBarItem(
                              icon: ImageIcon(AssetImage(KImages.searchIcon)),
                              label: ''),
                          BottomNavigationBarItem(
                              icon: ImageIcon(AssetImage(KImages.exploreIcon)),
                              label: ''),
                          BottomNavigationBarItem(
                              icon: ImageIcon(AssetImage(KImages.profileIcon)),
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

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/Features/movies/profile/data/data_source/profile_cubit/profile_cubit.dart';
import 'package:movies/Features/movies/profile/data/data_source/profile_cubit/profile_state.dart';
import 'package:movies/core/utility/constants/colors.dart';
import 'package:movies/core/utility/constants/images.dart';
import 'package:movies/core/utility/helper/network/dio_heper.dart';
import 'package:movies/core/utility/theme_data/custom_theme/text_theme.dart';

import '../widget/photo_custom_item.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  List<String> list = [
    KImages.movie1971,
    KImages.movieCaptain,
    KImages.movieBaby,
    KImages.movie1971,
    KImages.movieCaptain,
    KImages.movieBaby,
    KImages.movie1971,
    KImages.movieCaptain,
    KImages.movieBaby,
  ];
  final List<String> avatars = [
    KImages.avatar1,
    KImages.avatar2,
    KImages.avatar3,
    KImages.avatar4,
    KImages.avatar5,
    KImages.avatar6,
    KImages.avatar7,
    KImages.avatar8,
    KImages.avatar9,
  ];
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (context) =>
          ProfileCubit(GetProfileInitialState(), ApiService(dio: Dio()))
            ..getProfileMovies(),
      child: BlocBuilder<ProfileCubit, ProfileStates>(
        builder: (context, state) {
          var profileCubit = BlocProvider.of<ProfileCubit>(context);
          int id = (profileCubit.userModel?.avaterId ?? 2) % avatars.length;
          return CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate([
                  Stack(
                    children: [
                      Container(
                        height: height * .3,
                        color: AppColors.grayBackground,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 48),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Image.asset(avatars[
                                        (profileCubit.userModel?.avaterId ??
                                                4) %
                                            avatars.length]),
                                    const SizedBox(height: 16),
                                    Text(profileCubit.userModel?.name ?? '',
                                        style: KStyles.roboto20w700White),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text('12',
                                        style: KStyles.roboto20w700White),
                                    const SizedBox(height: 10),
                                    Text('Wish List',
                                        style: KStyles.roboto20w700White),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text('10',
                                        style: KStyles.roboto20w700White),
                                    const SizedBox(height: 10),
                                    Text('History',
                                        style: KStyles.roboto20w700White),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      child: Text('Edit Profile',
                                          style: KStyles.roboto20w400Black),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 40, vertical: 16),
                                      backgroundColor: Colors.red,
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text('Exit',
                                            style: KStyles.roboto20w400White),
                                        const SizedBox(width: 10),
                                        const Icon(Icons.output,
                                            size: 20, color: Colors.white),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ]),
              ),
              SliverAppBar(
                pinned: true,
                expandedHeight: height * 0.13,
                automaticallyImplyLeading: false,
                flexibleSpace: Container(
                  color: AppColors.grayBackground,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() => selected = 0);
                            },
                            child: Column(
                              children: [
                                const Icon(Icons.list,
                                    size: 50, color: AppColors.kPrimaryColor),
                                Text('Watch List',
                                    style: KStyles.roboto20w400White),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() => selected = 1);
                            },
                            child: Column(
                              children: [
                                const Icon(Icons.folder,
                                    size: 50, color: AppColors.kPrimaryColor),
                                Text('History',
                                    style: KStyles.roboto20w400White),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Divider(
                        endIndent: selected == 0 ? width * .5 : null,
                        indent: selected == 1 ? width * .5 : null,
                        thickness: 3,
                        color: AppColors.kPrimaryColor,
                      ),
                    ],
                  ),
                ),
              ),
              selected != 0
                  ? SliverGrid.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 0.65,
                        crossAxisSpacing: 24,
                        mainAxisSpacing: 8,
                      ),
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        return PhotoStarsItem(photo: list[index]);
                      },
                    )
                  : SliverToBoxAdapter(
                      child: Center(
                        child: Image.asset(
                          KImages.empty,
                          width: width * .5,
                          height: height * .5,
                        ),
                      ),
                    ),
            ],
          );
        },
      ),
    );
  }
}

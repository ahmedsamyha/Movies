import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movies/Features/movies/explore/presentation/widgets/explore_grid_view.dart';
import 'package:movies/Features/movies/explore/presentation/widgets/explore_list_items.dart';
import 'package:movies/Features/movies/explore/widget/explor_custom_item.dart';
import 'package:movies/core/utility/constants/colors.dart';
import 'package:movies/core/utility/constants/images.dart';
import 'package:movies/core/utility/theme_data/custom_theme/text_theme.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  List<String> list = [
    KImages.movie1971,
    KImages.movieCaptain,
    KImages.movie1971,
    KImages.movieBaby,
    KImages.movie1971,
    KImages.movieCaptain,
    KImages.movie1971,
    KImages.movieBaby, KImages.movie1971,
    KImages.movieCaptain,
    KImages.movie1971,
    KImages.movieBaby, KImages.movie1971,
    KImages.movieCaptain,
    KImages.movie1971,
    KImages.movieBaby,
    KImages.movie1971,
    KImages.movieCaptain,
    KImages.movie1971,
    KImages.movieBaby,
    KImages.movie1971,
    KImages.movieCaptain,
    KImages.movie1971,
    KImages.movieBaby, KImages.movie1971,
    KImages.movieCaptain,
    KImages.movie1971,
    KImages.movieBaby, KImages.movie1971,
    KImages.movieCaptain,
    KImages.movie1971,
    KImages.movieBaby,KImages.movie1971,
    KImages.movieCaptain,
    KImages.movie1971,
    KImages.movieBaby,
    KImages.movie1971,
    KImages.movieCaptain,
    KImages.movie1971,
    KImages.movieBaby, KImages.movie1971,
    KImages.movieCaptain,
    KImages.movie1971,
    KImages.movieBaby, KImages.movie1971,
    KImages.movieCaptain,
    KImages.movie1971,
    KImages.movieBaby,
  ];
  int selected=0;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child:CustomScrollView(
        slivers: [
          SliverList.builder(
              itemCount: 1,
              itemBuilder: (context,index){
                return Stack(
                  children: [
                    Container(
                      height: height*.33,
                      color: AppColors.grayBackground,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 52),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Image.asset('assets/images/avatar3.png'),
                                  SizedBox(height: 16,),
                      Text('name of user',
                        style: KStyles.roboto20w700White,),

                                ],
                              ),
                              Column(
                                children: [
                                  Text('12',style: KStyles.roboto20w700White,
                                  ),
                                  SizedBox(height: 20,),
                                  Text('Wish List',style: KStyles.roboto20w700White,
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text('10',style: KStyles.roboto20w700White,
                                  ),
                                  SizedBox(height: 20,),

                                  Text('History',style: KStyles.roboto20w700White,
                                  ),
                                ],
                              ),

                            ],
                          ),
                          SizedBox(height: 20,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton(onPressed: (){},
                                      child: Text('Edit Profile',
                                        style: KStyles.roboto20w400Black,)),
                                ),
                                SizedBox(width: 10,),
                                ElevatedButton(onPressed: (){},
                                    style: ElevatedButton.styleFrom(
                                        padding: EdgeInsets.symmetric(horizontal: 40,vertical: 16),
                                        backgroundColor: Colors.red
                                    ),
                                    child: Row(
                                      children: [
                                        Text('Exit',
                                          style: KStyles.roboto20w400White,), SizedBox(width: 10,),
                                        Icon(Icons.output,
                                          size: 20,
                                          color: Colors.white,)
                                      ],
                                    )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }),
          SliverAppBar(
            pinned: true,
            bottom: PreferredSize(preferredSize:  Size.fromHeight(height*.0808),
              child:  Stack(
                children: [
                  Container(
                    height: height*.145,
                    color: AppColors.grayBackground,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min, // لتجنب التجاوز
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 16,bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: (){
                                selected=0;
                                setState(() {

                                });
                              },
                              child: Column(
                                children: [
                                  Icon(Icons.list,
                                    size: 50,
                                    color: AppColors.kPrimaryColor,),
                                  Text('Watch List',
                                    style: KStyles.roboto20w400White,)
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                selected=1;
                                setState(() {

                                });
                              },
                              child: Column(
                                children: [
                                  Icon(Icons.folder,
                                    size: 50,
                                    color: AppColors.kPrimaryColor,),
                                  Text('History',
                                    style: KStyles.roboto20w400White,)
                                ],
                              ),
                            ),
                          ],),
                      ),
                      Divider(
                        endIndent:selected==0? width*.5:null,
                        indent:selected==1? width*.5:null,
                        thickness: 3,
                        color: AppColors.kPrimaryColor,
                      ),
                    ],
                  ),
                ],
              ),),

          ),
         selected!=0? SliverGrid.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.65,
                crossAxisSpacing: 24,
                mainAxisSpacing: 8),

              itemCount:list.length,itemBuilder: (context,index){
            return PhotoStarsItem(photo: list[index]);
          }):
         SliverToBoxAdapter(
           child: Image.asset(
             KImages.empty,
             width: width*.5,
             height:height*.5, // تحكم في الارتفاع حسب رغبتك

           ),
         ),

        ],
      )
    );
  }
}

import 'package:flutter/material.dart';
import 'package:movies/core/utility/theme_data/custom_theme/text_theme.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: height*.05,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Image.asset('assets/images/avatar2.png'),
                  SizedBox(height: 16,),
                  Text('name of user',
                  style: KStyles.roboto20w700White,)
                ],
              ),
              Column(
                children: [
                  Text('12',
                    style: KStyles.roboto20w700White,),
                  SizedBox(height: 20,),
                  Text('Wish List',
                    style: KStyles.roboto20w700White,),
                ],
              ),
              Column(
                children: [
                  Text('10',
                    style: KStyles.roboto20w700White,),
                  SizedBox(height: 20,),

                  Text('History',
                    style: KStyles.roboto20w700White,),
                ],
              ),

            ],
          ),

        ],
      ),
    );
  }
}

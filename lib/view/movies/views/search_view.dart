import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movies/core/utility/constants/colors.dart';
import 'package:movies/core/utility/constants/images.dart';

import 'package:movies/view/aouth/widgets/custom_text_form_field.dart';
import 'package:movies/view/movies/widgets/grid_view_item.dart';
import 'package:movies/view/movies/widgets/photo_stars_item.dart';

class SearchView extends StatelessWidget {
   SearchView({super.key});

   List<String> list = [
KImages.movie1971,
KImages.movieCaptain,
KImages.movie1971,
   ];
final  searching=TextEditingController();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(top: 21,left: 16,right: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,

        children: [
          CustomTextFormField(
              prefixIcon: Icons.search_sharp,
              label: "search".tr(),
              controller: searching,
              validator: (value) {},
              onChanged: (value) {},
              keyboardType: TextInputType.visiblePassword,
              obscureText: true),
      list.isEmpty?Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/searchIsEmpty.png'),
        ],
      ):GridViewItem(list: list)
        ],
      ),
    );
  }
}

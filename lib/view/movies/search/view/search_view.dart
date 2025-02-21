import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movies/core/utility/constants/colors.dart';
import 'package:movies/core/utility/constants/images.dart';
import 'package:movies/core/utility/theme_data/custom_theme/text_theme.dart';
import 'package:movies/view/aouth/widgets/custom_text_form_field.dart';
import 'package:movies/view/movies/search/widgets/search_grid_view.dart';

class SearchView extends StatelessWidget {
  SearchView({super.key});


  final searching = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
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
                validator: (value) {},
                onChanged: (value) {},
                keyboardType: TextInputType.visiblePassword,
                obscureText: true),
           /* list.isEmpty
                ? Padding(
                    padding: EdgeInsets.only(top: height * .27),
                    child: Image.asset('assets/images/searchIsEmpty.png'),
                  ) :*/
            SearchGridView(),
          ],
        ),
      ),
    );
  }
}

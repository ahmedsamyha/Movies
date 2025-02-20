import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movies/core/utility/constants/colors.dart';
import 'package:movies/core/utility/constants/images.dart';
import 'package:movies/core/utility/theme_data/custom_theme/text_theme.dart';
import 'package:movies/view/aouth/widgets/custom_text_form_field.dart';

class SearchView extends StatelessWidget {
   SearchView({super.key});

   List<String> list = [

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
      ):Expanded(
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.65,
              crossAxisSpacing: 16,
              mainAxisSpacing: 8),
          itemCount: list.length,
          itemBuilder: (context,index){
            return Stack(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(24)),
                    child: Image.asset(list[index],
                      fit: BoxFit.fill,
                    )),
                Container(
                  padding:
                  EdgeInsets.symmetric(horizontal: 3, vertical: 1),
                  margin:
                  EdgeInsets.symmetric(horizontal: 9, vertical: 11),
                  decoration: BoxDecoration(
                      color: Color(0xFF282A28).withValues(alpha: .8),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '7.7',
                        style: TextStyle(color: Colors.white),
                      ),
                      Icon(
                        Icons.star_rounded,
                        color: AppColors.kPrimaryColor,
                      )
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ),
        ],
      ),
    );
  }
}

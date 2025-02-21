import 'package:flutter/material.dart';
import 'package:movies/core/utility/constants/colors.dart';
import 'package:movies/core/utility/theme_data/custom_theme/text_theme.dart';
import 'package:easy_localization/easy_localization.dart';

class CustomOnBoardingBottomWidget extends StatelessWidget {
  const CustomOnBoardingBottomWidget({
    super.key, required this.title,required  this.content, required this.isActiveBack,required this.onNextPressed, this.onBackPressed, required this.btnText,
  });
  final String title;
  final String content;
  final String btnText;
  final bool isActiveBack;
  final void Function()? onNextPressed;
  final void Function()? onBackPressed;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding:
        EdgeInsets.only(top: 34, left: 16, right: 16, bottom: 20),
        decoration: BoxDecoration(
            color: AppColors.darkBackground,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: KStyles.inter24w700White,
              textAlign: TextAlign.center,
            ),

           content.isEmpty?SizedBox(height: 0,): Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text(
                content??'',
                style: KStyles.inter20w400White,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 24,
            ),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: onNextPressed,
                    child: Text(
                      btnText,
                      style: KStyles.inter20w600Black,
                    ))),
            SizedBox(height: 16,),
            isActiveBack? SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                    onPressed: onBackPressed,
                    child: Text(
                      "back".tr(),
                      style: KStyles.inter20w600primary,
                    ))):SizedBox(),

          ],
        ),
      ),
    );
  }
}

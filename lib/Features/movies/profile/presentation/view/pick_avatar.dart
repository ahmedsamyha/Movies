import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movies/Features/aouth/presentation/widgets/custom_text_form_field.dart';
import 'package:movies/core/utility/constants/colors.dart';
import 'package:movies/core/utility/theme_data/custom_theme/text_theme.dart';

import '../widget/show_buttom_sheet.dart';

class PickAvatar extends StatefulWidget {
  @override
  State<PickAvatar> createState() => _PickAvatarState();
}

class _PickAvatarState extends State<PickAvatar> {
  var nameControll = TextEditingController();
  var phoneNumberControll = TextEditingController();
  int? selected = 0;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(size: 30, color: AppColors.kPrimaryColor),
        centerTitle: true,
        title: Text('Pick Avatar', style: KStyles.roboto14w400Primary),
      ),
      body:  Padding(
        padding: const EdgeInsets.only(top: 37,right: 16,left: 16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: GestureDetector(
                      onTap: () async {
                        int? pickedPhoto = await showModalBottomSheet<int>(
                          context: context,
                          builder: (BuildContext context) {
                            return ShowButtomSheet(selectedPhoto: selected);
                          },
                        );
                        if (pickedPhoto != null) {
                          setState(() {
                            selected = pickedPhoto;
                          });
                        }
                      },
                      child: Image.asset(
                        "assets/images/avatar${(selected ?? 5) + 1}.png",
                        height: height * .15,
                        width: height * .15,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 35,),
              CustomTextFormField(
                prefixIcon: Icons.person,
                label: "name".tr(),
                controller: nameControll,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "name_required".tr();
                  } else if (value.length < 3) {
                    return "name_must_be".tr();
                  }
                  return null;
                },
                keyboardType: TextInputType.text,
                obscureText: false,
              ),
              SizedBox(height: 20,),
              CustomTextFormField(
                prefixIcon: Icons.phone,
                label: "phone",
                controller: phoneNumberControll,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Phone_required".tr();
                  }
                  return null;
                },
                keyboardType: TextInputType.phone,
                obscureText: false,
              ),
              SizedBox(height: 30,),
              Text('Reset Password',
                style: KStyles.roboto20w400White,),
              SizedBox(height: height*.2,),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.kSecondaryColor
                    ),
                    onPressed: (){}, child: Text('Delete Account',
                  style: KStyles.roboto20w400Black,)),
              ),
              SizedBox(height: 19),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    style: ButtonStyle(

                    ),
                    onPressed: (){}, child: Text('Update Data',
                  style: KStyles.roboto20w400Black,)),
              ),
            ],
          ),
        ),
      ),
    );

  }
}


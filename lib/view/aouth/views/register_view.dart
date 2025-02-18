import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies/core/utility/constants/colors.dart';
import 'package:movies/core/utility/constants/images.dart';
import 'package:movies/view/aouth/widgets/custom_text_form_field.dart';
import '../../../core/utility/theme_data/custom_theme/text_theme.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _LoginViewState();
}

class _LoginViewState extends State<RegisterView> {
  bool secondSwitchValue = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
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
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("register".tr()),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: height * .01,
              ),
              SizedBox(
                height: height * .19,
                child: Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return CircleAvatar(
                      backgroundColor: AppColors.darkBackground,
                      child: Image.asset(
                        avatars[index],
                        fit: BoxFit.fill,
                        height: height * .14,
                      ),
                    );
                  },
                  itemCount: avatars.length,
                  physics: const BouncingScrollPhysics(),
                  loop: false,
                  viewportFraction: .37,
                  scale: .01,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "avatar".tr(),
                style: KStyles.roboto16w400White,
              ),
              SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                  prefixIcon: Icons.person,
                  label: "name".tr(),
                  controller: nameController,
                  validator: (value) {},
                  onChanged: (value) {},
                  keyboardType: TextInputType.text,
                  obscureText: false),
              SizedBox(
                height: 24,
              ),
              CustomTextFormField(
                  prefixIcon: Icons.email,
                  label: "email".tr(),
                  controller: emailController,
                  validator: (value) {},
                  onChanged: (value) {},
                  keyboardType: TextInputType.emailAddress,
                  obscureText: true),
              SizedBox(
                height: 24,
              ),
              CustomTextFormField(
                  prefixIcon: Icons.lock,
                  suffixIcon: Icons.remove_red_eye_rounded,
                  label: "password".tr(),
                  controller: passwordController,
                  validator: (value) {},
                  onChanged: (value) {},
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true),
              SizedBox(
                height: 24,
              ),
              CustomTextFormField(
                  prefixIcon: Icons.lock,
                  suffixIcon: Icons.remove_red_eye_rounded,
                  label: "confirm_password".tr(),
                  controller: confirmPasswordController,
                  validator: (value) {},
                  onChanged: (value) {},
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true),
              SizedBox(
                height: 24,
              ),
              CustomTextFormField(
                  prefixIcon: Icons.phone,
                  label: "confirm_password".tr(),
                  controller: phoneController,
                  validator: (value) {},
                  onChanged: (value) {},
                  keyboardType: TextInputType.phone,
                  obscureText: false),
              SizedBox(
                height: 24,
              ),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "create_account".tr(),
                        style: KStyles.roboto20w400Black,
                      ))),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "already_have_account".tr(),
                    style: KStyles.roboto14w400White,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "login".tr(),
                      style: KStyles.roboto14w600Primary,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 16,
              ),
              AnimatedToggleSwitch.dual(
                current: secondSwitchValue,
                first: false,
                second: true,
                spacing: 10,
                style: ToggleStyle(
                  borderColor: AppColors.kPrimaryColor,
                  backgroundColor: Colors.transparent,
                  borderRadius: BorderRadius.circular(30),
                  indicatorColor: AppColors.kPrimaryColor,
                ),
                borderWidth: 3,
                height: 50,
                onChanged: (value) {
                  setState(() {
                    secondSwitchValue = value;
                    if (value == true) {
                      context.setLocale(Locale('en'));
                      print(context.locale.toString());
                    } else {
                      context.setLocale(Locale('ar'));
                      print(context.locale.toString());
                    }
                  });
                },
                iconBuilder: (value) => value
                    ? SvgPicture.asset(
                        'assets/images/lr.svg',
                        height: 40,
                        width: 40,
                      )
                    : SvgPicture.asset(
                        'assets/images/eg.svg',
                        height: 40,
                        width: 40,
                      ),
                textBuilder: (value) => value
                    ? SvgPicture.asset(
                        'assets/images/eg.svg',
                        height: 40,
                        width: 40,
                      )
                    : SvgPicture.asset('assets/images/lr.svg',
                        height: 40, width: 40),
                textMargin: EdgeInsets.zero,
              )
            ],
          ),
        ),
      ),
    );
  }
}

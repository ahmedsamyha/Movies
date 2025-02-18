import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:movies/core/utility/constants/colors.dart';
import 'package:movies/core/utility/constants/images.dart';
import 'package:movies/view/aouth/views/register_view.dart';
import 'package:movies/view/aouth/widgets/custom_text_form_field.dart';
import 'package:movies/view/movies/views/app_main.dart';

import '../../../core/utility/theme_data/custom_theme/text_theme.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool secondSwitchValue = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: height * .1,
              ),
              Center(
                child: SizedBox(
                    height: width * .24,
                    width: width * .24,
                    child: Image(
                      image: AssetImage(KImages.logo),
                      fit: BoxFit.fill,
                    )),
              ),
              SizedBox(
                height: height * .08,
              ),
              CustomTextFormField(
                  prefixIcon: Icons.email,
                  label: "email".tr(),
                  controller: emailController,
                  validator: (value) {},
                  onChanged: (value) {},
                  keyboardType: TextInputType.emailAddress,
                  obscureText: false),
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
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text("forget_password".tr(),
                      style: KStyles.roboto14w400Primary),
                ),
              ),
              SizedBox(
                height: 32,
              ),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>AppMainView()), (route) => false);
                      },
                      child: Text(
                        "login".tr(),
                        style: KStyles.roboto20w400Black,
                      ))),
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "do_not_have_account".tr(),
                    style: KStyles.roboto14w400White,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterView()));
                    },
                    child: Text(
                      "create_account".tr(),
                      style: KStyles.roboto14w600Primary,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 28,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: AppColors.kPrimaryColor,
                        thickness: 1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "or".tr(),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: AppColors.kPrimaryColor,
                        thickness: 1,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 28,
              ),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(KImages.google),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "login_with_google".tr(),
                            style: KStyles.roboto20w400Black,
                          ),
                        ],
                      ))),
              SizedBox(
                height: 32,
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

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movies/Features/aouth/presentation/widgets/custom_text_form_field.dart';
import 'package:movies/core/utility/constants/images.dart';
import 'package:movies/core/utility/theme_data/custom_theme/text_theme.dart';

class ForgetPasswordView extends StatelessWidget {
  static const String routName = "ForgetPasswordView";
  ForgetPasswordView({super.key});
  final emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Forget Password',
          style: KStyles.roboto14w600Primary,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(KImages.forgetPassword),
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
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "verify_email".tr(),
                      style: KStyles.roboto20w400Black,
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

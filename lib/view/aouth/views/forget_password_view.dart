import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movies/core/utility/constants/images.dart';
import 'package:movies/core/utility/theme_data/custom_theme/text_theme.dart';
import 'package:movies/view/aouth/widgets/custom_text_form_field.dart';

class ForgetPasswordView extends StatelessWidget {
  static const String routName="ForgetPasswordView";
   ForgetPasswordView({super.key});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Forget Password',
        style: KStyles.inter20w600primary,),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Image.asset("${KImages.forgetPassword}"),
            CustomTextFormField(
                prefixIcon: Icons.email,
                label: "email".tr(),
                controller: emailController,
                validator: (value) {},
                onChanged: (value) {},
                keyboardType: TextInputType.emailAddress,
                obscureText: false),
            SizedBox(height: 24,),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "verify_email".tr(),
                          style: KStyles.roboto20w400Black,
                        ),
                      ],
                    ))),
          ],
        ),
      ),
    );
  }
}

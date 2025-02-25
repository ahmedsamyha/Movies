import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/Features/aouth/data/data_source/register_cubit/register_cubit.dart';
import 'package:movies/Features/aouth/data/data_source/register_cubit/register_state.dart';
import 'package:movies/Features/aouth/presentation/views/login_view.dart';
import 'package:movies/Features/aouth/presentation/widgets/custom_text_form_field.dart';
import 'package:movies/core/utility/constants/colors.dart';
import 'package:movies/core/utility/constants/images.dart';
import 'package:movies/core/utility/theme_data/custom_theme/text_theme.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  bool secondSwitchValue = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  var avatarIndex = 0;
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
  late bool showPassword = true;
  void passwordState() {
    showPassword = !showPassword;
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return BlocConsumer<RegisterCubit, RegisterStates>(
      listener: (context, state) {
        if (state is RegisterLoadingState) {
          Center(
              child: CircularProgressIndicator(
            color: AppColors.kPrimaryColor,
          ));
        } else if (state is RegisterSuccessState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoginView()));
        } else if (state is RegisterFailureState) {
          if (state.errorMessage ==
              '{statusCode: 400, message: User already exist}') {
            AwesomeDialog(
              btnCancelColor: const Color(0xfff44369),
              btnOkColor: AppColors.kPrimaryColor,
              dialogBackgroundColor: AppColors.darkBackground,
              context: context,
              dialogType: DialogType.error,
              animType: AnimType.topSlide,
              title: "error".tr(),
              desc: "user_already_exist".tr(),
              btnOkOnPress: () {},
            ).show();
          } else if (state.errorMessage ==
                  '{message: [Password is must be strong, password must be longer than or equal to 8 characters, confirm password must be strong, confirmPassword must be longer than or equal to 8 characters], error: Bad Request, statusCode: 400}' ||
              state.errorMessage ==
                  '{message: [Password is must be strong, confirm password must be strong], error: Bad Request, statusCode: 400}') {
            AwesomeDialog(
              btnCancelColor: const Color(0xfff44369),
              btnOkColor: AppColors.kPrimaryColor,
              dialogBackgroundColor: AppColors.darkBackground,
              context: context,
              dialogType: DialogType.error,
              animType: AnimType.topSlide,
              title: "error".tr(),
              desc: "Password_must_be_at_least8".tr(),
              btnOkOnPress: () {},
            ).show();
          } else if (state.errorMessage ==
              '{message: [Phone invaild], error: Bad Request, statusCode: 400}') {
            AwesomeDialog(
              btnCancelColor: const Color(0xfff44369),
              btnOkColor: AppColors.kPrimaryColor,
              dialogBackgroundColor: AppColors.darkBackground,
              context: context,
              dialogType: DialogType.error,
              animType: AnimType.topSlide,
              title: "error".tr(),
              desc: "phone_invalid".tr(),
              btnOkOnPress: () {},
            ).show();
          } else {
            AwesomeDialog(
              btnCancelColor: const Color(0xfff44369),
              btnOkColor: AppColors.kPrimaryColor,
              dialogBackgroundColor: AppColors.darkBackground,
              context: context,
              dialogType: DialogType.error,
              animType: AnimType.topSlide,
              title: "error".tr(),
              desc: "unExpected_error".tr(),
              btnOkOnPress: () {},
            ).show();
          }
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text("register".tr()),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    SizedBox(height: height * .01),
                    SizedBox(
                      height: height * .19,
                      child: Swiper(
                        itemBuilder: (context, index) {
                          avatarIndex = index + 1;
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
                    SizedBox(height: 8),
                    Text("avatar".tr(), style: KStyles.roboto16w400White),
                    SizedBox(height: 16),
                    CustomTextFormField(
                      prefixIcon: Icons.person,
                      label: "name".tr(),
                      controller: nameController,
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
                    SizedBox(height: 24),
                    CustomTextFormField(
                      prefixIcon: Icons.email,
                      label: "email".tr(),
                      controller: emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "email_required".tr();
                        } else if (!RegExp(
                                r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                            .hasMatch(value)) {
                          return "enter_valid_email".tr();
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      obscureText: false,
                    ),
                    SizedBox(height: 24),
                    CustomTextFormField(
                      prefixIcon: Icons.lock,
                      suffixIcon: showPassword
                          ? Icons.remove_red_eye_rounded
                          : Icons.remove_red_eye_outlined,
                      label: "password".tr(),
                      controller: passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "password_required".tr();
                        } else if (value.length < 6) {
                          return "Password_is_week".tr();
                        }
                        return null;
                      },
                      onPressed: () {
                        setState(() {
                          passwordState();

                        });                      },
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: showPassword,
                    ),
                    SizedBox(height: 24),
                    CustomTextFormField(
                      prefixIcon: Icons.lock,
                      suffixIcon: showPassword
                          ? Icons.remove_red_eye_rounded
                          : Icons.remove_red_eye_outlined,
                      label: "confirm_password".tr(),
                      controller: confirmPasswordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "confirm_required".tr();
                        } else if (value != passwordController.text) {
                          return "Passwords_do_not_match".tr();
                        }
                        return null;
                      },
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: showPassword,
                      onPressed: () {
                        setState(() {
                          passwordState();

                        });                      },
                    ),
                    SizedBox(height: 24),
                    CustomTextFormField(
                      prefixIcon: Icons.phone,
                      label: "phone",
                      controller: phoneController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Phone_required".tr();
                        }
                        return null;
                      },
                      keyboardType: TextInputType.phone,
                      obscureText: false,
                    ),
                    SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            BlocProvider.of<RegisterCubit>(context).createUser(
                              name: nameController.text,
                              email: emailController.text,
                              password: passwordController.text,
                              confirmPassword: confirmPasswordController.text,
                              phone: '+2${phoneController.text}',
                              avaterId: avatarIndex,
                            );
                          }
                        },
                        child: Text(
                          "create_account".tr(),
                          style: KStyles.roboto20w400Black,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("already_have_account".tr(),
                            style: KStyles.roboto14w400White),
                        TextButton(
                          onPressed: () {},
                          child: Text("login".tr(),
                              style: KStyles.roboto14w600Primary),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

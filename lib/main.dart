import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/Features/movies/app_main/presentation/app_main.dart';
import 'package:movies/Features/movies/home/data/data_source/home_cubit/home_cubit.dart';
import 'package:movies/Features/movies/home/data/data_source/home_cubit/home_state.dart';
import 'package:movies/Features/movies/home/presentation/view/home_view.dart';
import 'Features/aouth/data/data_source/login_cubit/login_cubit.dart';
import 'Features/aouth/data/data_source/login_cubit/login_state.dart';
import 'Features/aouth/data/data_source/register_cubit/register_cubit.dart';
import 'Features/aouth/data/data_source/register_cubit/register_state.dart';
import 'Features/aouth/presentation/views/login_view.dart';
import 'Features/movies/app_main/data/data_source/app_main_cubit/app_main_cubit.dart';
import 'Features/movies/app_main/data/data_source/app_main_cubit/app_main_state.dart';
import 'core/utility/helper/network/dio_heper.dart';
import 'core/utility/theme_data/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
      path: 'assets/translations',
      saveLocale: true,
      fallbackLocale: const Locale('en'),
      child: const MoviesApp(),
    ),
  );
}

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppMainCubit(AppMainInitialState())),
        BlocProvider(
          create: (context) =>
              RegisterCubit(RegisterInitialState(), ApiService(dio: Dio())),
        ),
        BlocProvider(
          create: (context) =>
              LoginCubit(LoginInitialState(), ApiService(dio: Dio())),
        ),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.darkTheme,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        home:  AppMainView(),
      ),
    );
  }
}

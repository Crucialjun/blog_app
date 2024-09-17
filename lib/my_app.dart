import 'package:blog_app/core/app_theme.dart';
import 'package:blog_app/core/cubits/app_user/app_user_cubit.dart';
import 'package:blog_app/core/locator.dart';
import 'package:blog_app/core/routes.dart';
import 'package:blog_app/features/auth/presentation/pages/sign_in/bloc/sign_in_bloc.dart';
import 'package:blog_app/features/auth/presentation/pages/sign_in/sign_in_page.dart';
import 'package:blog_app/features/blog/presentation/blog_page.dart';
import 'package:blog_app/features/splash/presentation/bloc/splash_bloc.dart';
import 'package:blog_app/features/splash/presentation/splash_page.dart';
import 'package:blog_app/services/navigation_service/i_navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blog App',
      theme: AppTheme.darkThemeMode,
      onGenerateRoute: (settings) => Routes.generateRoute(settings),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => SignInBloc(),
          ),
          BlocProvider(
            create: (context) => AppUserCubit(),
          ),
        ],
        child: BlocSelector<AppUserCubit, AppUserState, bool>(
          selector: (state) {
            Logger().i('Initial state is : $state');
            return state is AppUserLoggedIn;
          },
          builder: (context, state) {
            Logger().i('User is logged in: $state');
            if (state) {
              return const BlogPage();
            } else {
              return const SignInPage();
            }
          },
        ),
      ),
      navigatorKey: INavigationService.navigatorKey,
    );
  }
}

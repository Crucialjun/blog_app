import 'package:blog_app/core/app_theme.dart';
import 'package:blog_app/core/routes.dart';
import 'package:blog_app/features/auth/presentation/pages/sign_in/bloc/sign_in_bloc.dart';
import 'package:blog_app/features/auth/presentation/pages/sign_in/sign_in_page.dart';
import 'package:blog_app/features/splash/presentation/bloc/splash_bloc.dart';
import 'package:blog_app/features/splash/presentation/splash_page.dart';
import 'package:blog_app/services/navigation_service/i_navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blog App',
      theme: AppTheme.darkThemeMode,
      onGenerateRoute: (settings) => Routes.generateRoute(settings),
      home: BlocProvider(
        create: (context) => SplashBloc()..add(SplashInitializeEvent()),
        child: BlocBuilder<SplashBloc, SplashState>(
          builder: (context, state) {
            return const SplashPage();
          },
        ),
      ),
      navigatorKey: INavigationService.navigatorKey,
    );
  }
}

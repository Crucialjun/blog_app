import 'package:blog_app/core/app_theme.dart';
import 'package:blog_app/core/cubits/app_user/app_user_cubit.dart';
import 'package:blog_app/core/routes.dart';
import 'package:blog_app/features/auth/presentation/pages/sign_in/bloc/sign_in_bloc.dart';
import 'package:blog_app/features/auth/presentation/pages/sign_in/sign_in_page.dart';
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
            return state is AppUserLoggedIn;
          },
          builder: (context, state) {
            if (state) {
              return const Scaffold(
                body: Center(
                  child: Text('User is logged in'),
                ),
              
              );
            }else{
              return const SignInPage();
            }
            
          },
        ),
      ),
      navigatorKey: INavigationService.navigatorKey,
    );
  }
}

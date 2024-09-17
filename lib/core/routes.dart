import 'package:blog_app/features/auth/presentation/pages/sign_in/bloc/sign_in_bloc.dart';
import 'package:blog_app/features/auth/presentation/pages/sign_in/sign_in_page.dart';
import 'package:blog_app/features/auth/presentation/pages/sign_up/bloc/sign_up_bloc.dart';
import 'package:blog_app/features/auth/presentation/pages/sign_up/sign_up_page.dart';
import 'package:blog_app/features/blog/presentation/add_new_blog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SignUpPage.routeName:
        return _registerBlocView(
          view: const SignUpPage(),
          bloc: SignUpBloc(),
          settings: settings,
        );
      case SignInPage.routeName:
        return _registerBlocView(
          view: const SignInPage(),
          bloc: SignInBloc(),
          settings: settings,
        );

      case AddNewBlogScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const AddNewBlogScreen(),
        );

      default:
        return MaterialPageRoute(builder: (_) => const Scaffold());
    }
  }

  static MaterialPageRoute _registerBlocView<T extends Bloc>({
    required Widget view,
    required T bloc,
    required RouteSettings settings,
  }) {
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => BlocProvider<T>(
        create: (context) => bloc,
        child: view,
      ),
    );
  }
}

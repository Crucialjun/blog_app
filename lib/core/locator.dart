import 'package:blog_app/services/navigation_service/i_navigation_service.dart';
import 'package:blog_app/services/navigation_service/navigation_service.dart';
import 'package:blog_app/services/supabase_service/i_supabase_service.dart';
import 'package:blog_app/services/supabase_service/supabase_service.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

Future setupLocator() async {
  locator.registerLazySingleton<NavigationService>(() => INavigationService());
  locator.registerLazySingleton<SupabaseService>(() => ISupabaseService());
}

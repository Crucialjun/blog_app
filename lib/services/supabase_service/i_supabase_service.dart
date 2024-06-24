import 'package:blog_app/core/failure.dart';
import 'package:blog_app/services/supabase_service/supabase_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ISupabaseService implements SupabaseService {
  final supabase = Supabase.instance.client;

  @override
  Future<Map<String, dynamic>> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      var res = await supabase.auth
          .signInWithPassword(email: email, password: password);
      if (res.user == null) {
        throw const Failure("User is null");
      } else {
        return res.user!.toJson();
      }
    } catch (e) {
      throw Failure(e.toString());
    }
  }

  @override
  Future<Map<String, dynamic>?> signUpWithEmailAndPassword(
      {required String email,
      required String password,
      required String name}) async {
    try {
      var res = await supabase.auth
          .signUp(email: email, password: password, data: {"name": name});

      if (res.user == null) {
        throw const Failure("User is null");
      } else {
        return res.user?.toJson();
      }
    } catch (e) {
      throw Failure(e.toString());
    }
  }

  @override
  Session? get currentSession => supabase.auth.currentSession;

  @override
  Future<Map<String, dynamic>?> getCurrentUserData() async {
    try {
      if (currentSession == null) {
        return null;
      }
      final user = await supabase
          .from('profiles')
          .select()
          .eq('id', currentSession!.user.id);
      return user[0];
    } catch (e) {
      throw Failure(e.toString());
    }
  }
}

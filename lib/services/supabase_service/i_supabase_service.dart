import 'package:blog_app/core/failure.dart';
import 'package:blog_app/services/supabase_service/supabase_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ISupabaseService implements SupabaseService {
  final supabase = Supabase.instance.client;

  @override
  Future<String> signInWithEmailAndPassword(
      {required String email, required String password}) {
    // TODO: implement signInWithEmailAndPassword
    throw UnimplementedError();
  }

  @override
  Future<String> signUpWithEmailAndPassword(
      {required String email,
      required String password,
      required String name}) async {
    try {
      var res = await supabase.auth
          .signUp(email: email, password: password, data: {"name": name});

      if (res.user == null) {
        throw const Failure("User is null");
      } else {
        return res.user!.email!;
      }
    } catch (e) {
      throw Failure(e.toString());
    }
  }
}

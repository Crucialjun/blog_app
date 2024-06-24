import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class SupabaseService {
  Future<Map<String,dynamic>?>signUpWithEmailAndPassword(
      {required String email, required String password, required String name});
  Future<Map<String,dynamic>?> signInWithEmailAndPassword(
      {required String email, required String password});
  Session? get currentSession;
  Future<Map<String,dynamic>?> getCurrentUserData();
}

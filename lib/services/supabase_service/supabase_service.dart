abstract interface class SupabaseService {
  Future<String> signUpWithEmailAndPassword(
      {required String email, required String password, required String name});
  Future<String> signInWithEmailAndPassword(
      {required String email, required String password});
}

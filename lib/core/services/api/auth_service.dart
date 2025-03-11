import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final supabase = Supabase.instance.client;

  Future<bool> signUp(String email, String password) async {
    try {
      await supabase.auth.signUp(email: email, password: password);
      return true;
    } catch (e) {
      print("Sign Up Error: $e");
      return false;
    }
  }

  Future<bool> signIn(String email, String password) async {
    try {
      await supabase.auth.signInWithPassword(email: email, password: password);
      return true;
    } catch (e) {
      print("Sign In Error: $e");
      return false;
    }
  }

  Future<void> signOut() async {
    await supabase.auth.signOut();
  }
}

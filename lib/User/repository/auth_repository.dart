import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_auth_platzi.dart';
class AuthRepository {
  final _firabeAuthPlatzi = FirebaseAuthPlatzi();
  Future<UserCredential> signInFirebase() => _firabeAuthPlatzi.signInWithGoogle();
  signOut() => _firabeAuthPlatzi.signOut();
}
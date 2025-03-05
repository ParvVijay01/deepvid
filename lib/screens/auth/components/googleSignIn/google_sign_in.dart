import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<User?> signInWithGoogle() async {
    try {
      // Trigger Google Sign-In
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return null; // User canceled login

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in to Firebase with Google credentials
      final UserCredential userCredential = await _auth.signInWithCredential(
        credential,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      print("Firebase Auth Error: ${e.message}");
      throw _handleFirebaseError(e);
    } catch (e) {
      log("General Error: $e");
      throw "An unexpected error occurred. Please try again.";
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
  }

  String _handleFirebaseError(FirebaseAuthException e) {
    switch (e.code) {
      case 'network-request-failed':
        return "No internet connection. Please check your network.";
      case 'account-exists-with-different-credential':
        return "This account already exists with a different login method.";
      case 'invalid-credential':
        return "Invalid credentials. Please try again.";
      case 'user-disabled':
        return "This user account has been disabled.";
      default:
        return "Authentication error. Please try again.";
    }
  }
}

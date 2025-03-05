import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Sign Up with Email & Password
  Future<User?> signUpWithEmail(
      String name,
      String? lastName,
      String vibeId,
      String email,
      String password,
      ) async {
    try {
      // Create user in Firebase Authentication
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      User? user = userCredential.user;
      if (user != null) {
        // Store additional details in Firestore
        await _firestore.collection('users').doc(user.uid).set({
          'name': name,
          'lastName': lastName,
          'vibeId': vibeId,
          'email': email,
          'createdAt': FieldValue.serverTimestamp(),
        });

        return user;
      }
      return null;
    } on FirebaseAuthException catch (e) {
      log("FirebaseAuthException: [${e.code}] ${e.message}");
      return Future.error(_handleAuthError(e)); // Return proper auth error
    } catch (e, stackTrace) {
      log("Unexpected Error in signUpWithEmail: $e", stackTrace: stackTrace);
      return Future.error("Unexpected error: $e"); // Return actual error
    }
  }

  // Login with Email & Password
  Future<User?> loginWithEmail(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      debugPrint("Login Error: \${e.message}");
      return Future.error(_handleAuthError(e));
    }
  }

  // Logout
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      debugPrint("Logout Error: \$e");
      return Future.error("Failed to logout. Please try again.");
    }
  }

  // Get Current User
  User? getCurrentUser() {
    return _auth.currentUser;
  }

  // Handle Firebase Auth Errors
  String _handleAuthError(FirebaseAuthException e) {
    switch (e.code) {
      case 'email-already-in-use':
        return "The email is already registered. Please use a different email.";
      case 'invalid-email':
        return "The email address is not valid.";
      case 'weak-password':
        return "The password is too weak. Please use a stronger password.";
      case 'user-not-found':
        return "No user found for this email.";
      case 'wrong-password':
        return "Incorrect password. Please try again.";
      case 'user-disabled':
        return "This user account has been disabled.";
      default:
        return "An unexpected error occurred. Please try again later.";
    }
  }
}


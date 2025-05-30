import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:onlineshop/services/authservice.dart';

class AuthProvider extends ChangeNotifier {
  final AuthService _authService = AuthService();
 final FirebaseAuth auth = FirebaseAuth.instance;
  // Controllers for UI input
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  bool agreeToTerms = false;
  bool  isLoading = false;

  // Loading state for showing CircularProgressIndicator

User? user;



  AuthProvider() {
    user = auth.currentUser;
    auth.authStateChanges().listen((User? user) {
      user = user;
      notifyListeners();
    });
  }

  bool get isLoggedIn => user != null && user!.emailVerified;

  // Private method to toggle loading
  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  void agreeTo(bool value){
agreeToTerms = value ?? false;
notifyListeners();
  }

  void togglePasswordvisi(){
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }

    void confirmTogglePasswordvisi(){
    isConfirmPasswordVisible = !isConfirmPasswordVisible;
    notifyListeners();
  }

  /// Sign up with email and password
  Future<bool> signUp() async {
    setLoading(true);
    try {
      await _authService.signUp(
        name: nameController.text.trim(),
        email: emailController.text.trim(),
        phone: phoneController.text.trim(),
        password: passwordController.text,
      );
      log('Sign up successful!');
      return true;
    } catch (e) {
      log('Sign up error: $e');
      return false;
    } finally {
      setLoading(false);
    }
  }

  /// Sign in with email and password
  Future<bool> signIn() async {
    setLoading(true);
    try {
      await _authService.SignIn(
        email: emailController.text.trim(),
        password: passwordController.text,
      );
    
      return true;
    } catch (e) {
      log('Login error: $e');
      return false;
    } finally {
      setLoading(false);
    }
  }

  /// Google Sign-In
  Future<User?> signInWithGoogle() async {
    setLoading(true);
    try {
      final user = await _authService.signInWithGoogle();
      if (user != null) {
        log('Google sign-in successful: ${user.email}');
      }
      return user;
    } catch (e) {
      log('Google sign-in error: $e');
      return null;
    } finally {
      setLoading(false);
    }
  }

  /// Logout
  Future<void> logout() async {
    await _authService.logOutEmail();
  }

  /// Clear all input fields
  void disposeControllers() {
    nameController.clear();
    emailController.clear();
    phoneController.clear();
    passwordController.clear();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  User? getCurrentUser(){
  return _authService.getCurrentUser();
  }

Future<void> SignOutGoogle()async{
  try {
    await _authService.signOutFromGoogle();
  } catch (e) {
    
  }
} 


}

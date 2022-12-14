import 'package:getfitts/service/auth/auth_user.dart';

abstract class AuthProvider {
  Future<void> initialize();
  AuthUser? get currentUser;

  Future<AuthUser> login({required String email, required String password});
  Future<AuthUser> createUser(
      {required String email,
      required String password,
      required String firstName,
      required String lastName});
  Future<void> logout();
  Future<void> sendEmailVerification();
  Future<void> sendPasswordReset({required String toEmail});
}
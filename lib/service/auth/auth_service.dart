import 'package:getfitts/service/auth/auth_user.dart';
import 'package:getfitts/service/auth/firebase_auth_provider.dart';
import 'package:getfitts/service/auth_provider.dart';

class AuthService implements AuthProvider {
  final AuthProvider provider;

  AuthService(this.provider);
  factory AuthService.firebase() => AuthService(
        FirebaseAuthProvider(),
      );

  @override
  Future<AuthUser> createUser(
          {required String email,
          required String password,
          required String firstName,
          required String lastName}) =>
      provider.createUser(
          email: email,
          password: password,
          firstName: firstName,
          lastName: lastName);

  @override
  // TODO: implement currentUser
  AuthUser? get currentUser => provider.currentUser;

  @override
  Future<void> initialize() => provider.initialize();

  @override
  Future<AuthUser> login({required String email, required String password}) =>
      provider.login(email: email, password: password);

  @override
  Future<void> logout() => provider.logout();

  @override
  Future<void> sendEmailVerification() => provider.sendEmailVerification();
}

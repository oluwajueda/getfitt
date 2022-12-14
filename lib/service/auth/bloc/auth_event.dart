import "package:flutter/foundation.dart" show immutable;

@immutable
abstract class AuthEvent {
  const AuthEvent();
}

class AuthEventInitialize extends AuthEvent {
  const AuthEventInitialize();
}

class AuthEventSendEmailVerification extends AuthEvent {
  const AuthEventSendEmailVerification();
}

class AuthEventLogin extends AuthEvent {
  final String email;
  final String password;

  const AuthEventLogin(this.email, this.password);
}

class AuthEventLogOut extends AuthEvent {
  const AuthEventLogOut();
}

class AuthEventRegister extends AuthEvent {
  final String email;
  final String password;
  final String firstName;
  final String lastName;

  const AuthEventRegister(
      this.email, this.password, this.firstName, this.lastName);
}

class AuthEventShouldRegister extends AuthEvent {
  final String? email;

  const AuthEventShouldRegister(this.email);
}
import 'package:bloc/bloc.dart';
import 'package:getfitts/service/auth/bloc/auth_event.dart';
import 'package:getfitts/service/auth/bloc/auth_state.dart';
import 'package:getfitts/service/auth_provider.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(AuthProvider provider)
      : super(const AuthStateInitialized(isLoading: true)) {
    on<AuthEventShouldRegister>((event, emit) {
      emit(const AuthStateRegistering(isLoading: false, exception: null));
    });

    //register user
    on<AuthEventRegister>((event, emit) async {
      final email = event.email;
      final password = event.password;
      final firstName = event.firstName;
      final lastName = event.lastName;
    });
  }
}

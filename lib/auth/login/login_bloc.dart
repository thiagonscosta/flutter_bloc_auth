import 'dart:html';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_auth/auth/login/login_event.dart';
import 'package:flutter_todo_auth/auth/login/login_state.dart';
import 'package:flutter_todo_auth/auth/repository/auth_repository.dart';

import 'fom_submission_status.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepository;

  LoginBloc({required this.authRepository}) : super(LoginState());

  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginEmailChanged) {
      yield state.copyWith(email: event.email);
    } else if (event is LoginPasswordChanged) {
      yield state.copyWith(password: event.password);
    } else if (event is LoginSubmitted) {
      yield state.copyWith(formStatus: FormSubmitting());

      try {
        await authRepository.login();
        yield state.copyWith(formStatus: SubmissionSuccess());
      } catch (e) {
        yield state.copyWith(formStatus: SubmissionFailded(Exception(e)));
      }
    }
  }
}

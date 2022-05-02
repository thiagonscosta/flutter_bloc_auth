import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_auth/auth/login/login_bloc.dart';

import '../auth/repository/auth_repository.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider(
      create: (context) =>
          LoginBloc(authRepository: context.read<AuthRepository>()),
      child: _loginForm(),
    ));
  }

  Widget _loginForm() {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              _emailField(),
              _passwordField(),
              _loginButton()
            ])),
      ),
    );
  }

  Widget _passwordField() {
    return TextFormField(
      obscureText: true,
      decoration: const InputDecoration(
          icon: Icon(Icons.security), hintText: 'Password'),
      validator: (value) => null,
    );
  }

  Widget _emailField() {
    return TextFormField(
      obscureText: true,
      decoration:
          const InputDecoration(icon: Icon(Icons.email), hintText: 'E-mail'),
      validator: (value) => null,
    );
  }

  Widget _loginButton() {
    return ElevatedButton(
      child: const Text('Login'),
      onPressed: () {},
    );
  }
}

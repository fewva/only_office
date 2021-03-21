import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:meta/meta.dart';
import 'package:only_office/network/network.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {

  final TextEditingController loginFieldController;
  final TextEditingController passwordFieldController;
  final TextEditingController portalFieldController;
  
  AuthBloc({
    this.loginFieldController,
    this.passwordFieldController,
    this.portalFieldController
  }) : super(AuthInitial());

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,

  ) async* {

    if (event is LoginEvent)  {

      if (
        loginFieldController.text == '' ||
        passwordFieldController.text == '' ||
        portalFieldController.text == ''
      ) {

        yield ValidationError();

      } else {

        yield TryingToLogIn();

        try {

          var ans = await Network.login(
            login: loginFieldController.text,
            password: passwordFieldController.text,
            portal: portalFieldController.text
          );

          String _token = jsonDecode(ans.data)['response']['token'];
          String _tokenExpirationDate = jsonDecode(ans.data)['response']['expires'];

          final _storage = FlutterSecureStorage();

          await _storage.write(key: 'token', value: _token);
          await _storage.write(key: 'portal', value: portalFieldController.text);
          await _storage.write(key: 'token_expiration_date', value: _tokenExpirationDate);

          Network.token = _token;
          Network.portal = portalFieldController.text;

          yield LoginCompleted();

        }   catch (e) {
          yield RequestError(error: e);
        }

      }
    }
  }
}
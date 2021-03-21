import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:only_office/bloc/folders_bloc.dart';
import 'package:only_office/components/custom_text_field.dart';
import 'package:only_office/components/snackbar.dart';
import 'package:only_office/pages/auth_page/local_blocs/auth_bloc.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var _loginController = TextEditingController();
    var _passwordController = TextEditingController();
    var _portalController = TextEditingController();

    return BlocProvider(
      create: (context) {
        return AuthBloc(
          loginFieldController: _loginController,
          passwordFieldController: _passwordController,
          portalFieldController: _portalController
        );
      },
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text('Connect to ONLYOFFICE', style: TextStyle(fontSize: 28)),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  CustomTextField(
                    labelText: 'Portal',
                    textEditingController: _portalController
                  ),
                  CustomTextField(
                    labelText: 'Login',
                    textEditingController: _loginController
                  ),
                  CustomTextField(
                    labelText: 'Password',
                    textEditingController: _passwordController
                  ),
                ],
              ),
            ),
            BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                
                if (state is RequestError) {
                  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                    ScaffoldMessenger.of(context).showSnackBar(snackBar(state.error.message));
                  });
                }

                if (state is ValidationError) {
                  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                    ScaffoldMessenger.of(context).showSnackBar(snackBar('Please fill in all available fields'));
                  });
                }

                if (state is LoginCompleted)  {
                  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                    BlocProvider.of<FoldersBloc>(context).add(GetMyDocumentsEvent());
                    Navigator.of(context).pushReplacementNamed('/Folders');
                  });
                }

                return FlatButton(
                  color: Colors.red,
                  onPressed: () { BlocProvider.of<AuthBloc>(context).add(LoginEvent()); },
                  child: state is TryingToLogIn 
                    ? SizedBox(height: 20, width: 20, child: const CircularProgressIndicator())
                    : const Text('LOGIN')
                );
                
              },
            )
          ],
        ),
      )
    );
  }
}
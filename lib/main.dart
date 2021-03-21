import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:only_office/bloc/folders_bloc.dart';
import 'package:only_office/network/network.dart';
import 'package:only_office/pages/auth_page/views/auth_page.dart';
import 'package:only_office/pages/folders_page/views/folders_page.dart';
import 'package:only_office/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FoldersBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: theme,
        initialRoute: '/Home',
        routes: {
          '/Home': (context) => Home(),
          '/Auth': (context) => AuthPage(),
          '/Folders': (context) => FoldersPage(),
        },
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: _isLogined(),
      builder: (context, snapshot) {
        if (!snapshot.hasData)  { return Material(); }
        if (snapshot.data == 'No data') { return AuthPage(); }
        if (snapshot.data == 'Update token') {
          return Material(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('You need to re-log in'),
                TextButton(
                  onPressed: () => Navigator.pushReplacementNamed(context, '/Auth'),
                  child: Text('OK! NO PROBLEM MA FREN! :)')
                ),
              ],
            ),
          );
        } 
        else {
          BlocProvider.of<FoldersBloc>(context).add(GetMyDocumentsEvent());
          return FoldersPage();
        }
      }
    );
  }
}

Future _isLogined() async {

  final storage = FlutterSecureStorage();

  var token = await storage.read(key: 'token');
  var portal = await storage.read(key: 'portal');

  Network.portal = portal;
  Network.token = token;
  
  if (token != null && portal != null) {
    

    // check the token for availability
    dynamic tokenExpirationDate = await storage.read(key: 'token_expiration_date');
    tokenExpirationDate = DateTime.parse(tokenExpirationDate);

    var now = DateTime.now();

    // if the token expires in less than a week
    if (now.difference(tokenExpirationDate) > Duration(days: -7))  {
      await storage.deleteAll();
      return 'Update token';
    }

    return token;
      
  } else {
    return 'No data';
  }
}

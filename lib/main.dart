import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:only_office/bloc/folders_bloc.dart';
import 'package:only_office/network/network.dart';
import 'package:only_office/pages/auth/views/auth_page.dart';
import 'package:only_office/pages/folders_page/views/folders_page.dart';
import 'package:only_office/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final storage = FlutterSecureStorage();
    // storage.delete(key: 'token');
    return BlocProvider(
      create: (context) => FoldersBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: theme,
        initialRoute: '/Home',
        routes: {
          // When navigating to the "/" route, build the FirstScreen widget.
          '/Home': (context) => Home(),
          // When navigating to the "/second" route, build the SecondScreen widget.
          '/Auth': (context) => AuthPage(),
          '/Folders': (context) => FoldersPage(),
        },
        // home: BlocProvider(
        //   create: (context) => FoldersBloc(),
        //   child: FutureBuilder(
        //     future: _isLogined(),
        //     builder: (context, snapshot) {
        //       if (snapshot.data == null) {
        //         return AuthPage();
        //       } else {
        //         BlocProvider.of<FoldersBloc>(context).add(GetMyDocumentsEvent());
        //         return FoldersPage();
        //       }
        //     }
        //   ),
        // ),
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
        if (!snapshot.hasData)  {
          return Material();
        }
        if (snapshot.data == 'No data') {
          return AuthPage();
        } else {
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

  print(token);
  print(portal);

  Network.portal = portal;
  Network.token = token;
  
  if (token != null && portal != null) {
    

    return token;
      
  } else {
    return 'No data';
  }
}

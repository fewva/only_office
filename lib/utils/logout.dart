import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:only_office/bloc/folders_bloc.dart';
import 'package:only_office/network/network.dart';

Future <bool> logout(context) async {

  print('LOGOUT');

  final _storage = FlutterSecureStorage();
  await _storage.deleteAll();

  print(await _storage.readAll());

  // Network.token = null;
  // Network.portal = null;

  // await BlocProvider.of<FoldersBloc>(context).close();

  // print('LOGOUT COMPLETED');
  return true;
}
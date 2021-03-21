import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:only_office/bloc/folders_bloc.dart';

Future <bool> logout(context) async {

  final _storage = FlutterSecureStorage();
  await _storage.deleteAll();

  BlocProvider.of<FoldersBloc>(context).add(BackToInititalState());

  return true;
}
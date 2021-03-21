import 'package:flutter/material.dart';
import 'package:only_office/bloc/folders_bloc.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {

  final foldersState;

  @override
  final Size preferredSize = Size(double.infinity, 56);

  CustomAppBar({this.foldersState});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: foldersState is FolderLoadingCompleted
        ? Text(foldersState.folder['current']['title'])
        : const Text('')
    );
  }
}

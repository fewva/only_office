import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:only_office/bloc/folders_bloc.dart';
import 'package:only_office/models/folder.dart';

class FolderTile extends StatelessWidget {

  final Folder folder;
  const FolderTile({
    Key key,
    this.folder
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        onTap: () async {

          BlocProvider.of<FoldersBloc>(context).add(GetFolderEvent(folderId: folder.id));
          
        },
        leading: Container(
          width: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey[300]
          ),
          child: Center(
            child: Icon(Icons.folder_rounded),
          ),
        ),
        title: Text(
          folder.title,
          style: TextStyle(color: Colors.black87),
        ),
      ),
    );
  }
}
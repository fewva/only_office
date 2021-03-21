part of 'folders_page.dart';

class ScaffoldBody extends StatelessWidget {

  final foldersState;

  const ScaffoldBody({
    Key key,
    this.foldersState
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    if (foldersState is FolderLoading || foldersState is FoldersInitial) {
      return const Material(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (foldersState is FolderLoadingError)  {
      return Material(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Center(child: Text(foldersState.error.toString())),
        ),
      );
    }

    if (foldersState is FolderLoadingCompleted)  {

      List _folders = _getFolders(foldersState.folder);
      List _files = _getFiles(foldersState.folder);
      var _parentId = _getParentID(foldersState.folder);
      

      return ListView(
        padding: const EdgeInsets.symmetric(vertical: 10),
        children: [
          if (_parentId != 0)
            _BackButton(parentId: _parentId),
          for (var i = 0; i < _folders.length; i++)
            FolderTile(folder: _folders[i]),
          for (var i = 0; i < _files.length; i++)
            FileTile(file: _files[i]),
        ],
      );
    }

    else { return const Material(child: Text('DUNNO WHAT IS IT')); }
  }
}

class _BackButton extends StatelessWidget {

  final int parentId;
  const _BackButton({
    Key key,
    this.parentId
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          iconSize: 20,
          icon: Icon(Icons.arrow_back_ios_outlined),
          onPressed: () => BlocProvider.of<FoldersBloc>(context).add(GetFolderEvent(folderId: parentId))
        ),
        TextButton(
          onPressed: () => BlocProvider.of<FoldersBloc>(context).add(GetFolderEvent(folderId: parentId)),
          child: Text('Back', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w400, fontSize: 18))
        )
      ],
    );
  }
}


List <Folder> _getFolders(Map folder){

  List folders = folder['folders'];

  folders = folders
    .map((element) => element = Folder.fromJson(element)).toList()
    .cast<Folder>();

  return folders;

}

List <File> _getFiles(Map folder){

  List files = folder['files'];

  files = files
    .map((element) => element = File.fromJson(element)).toList()
    .cast<File>();

  return files;

}

int _getParentID(Map folder){

  return folder['current']['parentId'];

}
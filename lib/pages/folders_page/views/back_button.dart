part of 'folders_page.dart';

class BackButton extends StatelessWidget {

  final int parentId;
  const BackButton({
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
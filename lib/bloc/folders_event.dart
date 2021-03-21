part of 'folders_bloc.dart';

@immutable
abstract class FoldersEvent {}

class GetFolderEvent extends FoldersEvent  {

  final int folderId;
  GetFolderEvent({@required this.folderId});

}

class GetMyDocumentsEvent extends FoldersEvent  {}

class GetCommonDocumentsEvent extends FoldersEvent  {}

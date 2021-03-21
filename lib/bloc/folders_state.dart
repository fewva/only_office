part of 'folders_bloc.dart';

@immutable
abstract class FoldersState {}

class FoldersInitial extends FoldersState {}

class FolderLoading extends FoldersState {}

class FolderLoadingError extends FoldersState {

  final error;
  FolderLoadingError({this.error});

}

class FolderLoadingCompleted extends FoldersState {

  final Map folder;
  FolderLoadingCompleted({this.folder});

}
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:only_office/network/network.dart';

part 'folders_event.dart';
part 'folders_state.dart';

class FoldersBloc extends Bloc<FoldersEvent, FoldersState> {
  FoldersBloc() : super(FoldersInitial());

  String _currentSection = 'My documents';

  String get getCurrentStorage => _currentSection;

  set setCurrentStorage(String currStor) => _currentSection = currStor;

  @override
  Stream<FoldersState> mapEventToState(
    FoldersEvent event,
  ) async* {

    if (event is GetFolderEvent)  {

      yield FolderLoading();

      try {
        
        var folder = await Network.getFolderByID(event.folderId);
        yield FolderLoadingCompleted(folder: folder);

      } catch (e) {
        yield FolderLoadingError(error: e);
      }

    }

    if (event is GetMyDocumentsEvent) {

      yield FolderLoading();

      try {

        var myDocs = await Network.getMySection();
        yield FolderLoadingCompleted(folder: myDocs);
        
      } catch (e) {
        yield FolderLoadingError(error: e);
      }

    }

    if (event is GetCommonDocumentsEvent) {

      yield FolderLoading();

      try {

        var commonDocs = await Network.getCommonSection();
        yield FolderLoadingCompleted(folder: commonDocs);
        
      } catch (e) {
        yield FolderLoadingError(error: e);
      }

    }

    if (event is BackToInititalState) {

      _currentSection = 'My documents';
      yield FoldersInitial();

    }

  }
}

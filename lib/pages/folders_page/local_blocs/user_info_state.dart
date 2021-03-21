part of 'user_info_bloc.dart';

@immutable
abstract class UserInfoState {}

class UserInfoInitial extends UserInfoState {}

class UserInfosInitial extends UserInfoState {}

class UserInfoLoading extends UserInfoState {}

class UserInfoLoadingError extends UserInfoState {

  final error;
  UserInfoLoadingError({this.error});

}

class UserInfoLoadingCompleted extends UserInfoState {

  final User user;
  UserInfoLoadingCompleted({this.user});

}
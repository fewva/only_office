import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:only_office/models/user.dart';
import 'package:only_office/network/network.dart';

part 'user_info_event.dart';
part 'user_info_state.dart';

class UserInfoBloc extends Bloc<UserInfoEvent, UserInfoState> {
  UserInfoBloc() : super(UserInfoInitial());

  @override
  Stream<UserInfoState> mapEventToState(
    UserInfoEvent event,
  ) async* {

    if (event is GetUserInfoEvent)  {

      yield UserInfoLoading();

      try {

        var _user = await Network.getUser();
        yield UserInfoLoadingCompleted(user: _user);

      } catch (e) {

        yield UserInfoLoadingError(error: e);

      }

    }

  }
}

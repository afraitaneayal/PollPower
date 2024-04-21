import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:poll_power/core/extensions/context_extension.dart';
import 'package:poll_power/core/extensions/string_extension.dart';
import 'package:poll_power/domain/params/user/get_user_param.dart';
import 'package:poll_power/domain/usecases/user/get_user_usecase.dart';
import 'package:poll_power/presentation/state_management/bloc/user/user_event.dart';
import 'package:poll_power/presentation/state_management/bloc/user/user_state.dart';

import '../../../../core/ui/theme/colors/i_app_colors.dart';
import '../../../../di.dart';
import '../../../../router.dart';

@singleton
class UserBloc extends Bloc<UserEvent, UserState> {
  final GetUserUsecase _getUserUsecase;
  UserBloc(this._getUserUsecase) : super(UserInitialState()) {
    _mapEvent();
  }

  Future<void> _mapEvent() async {
    on<GetUserInfoEvent>((GetUserInfoEvent event, Emitter emit) async {
      emit(GetUserInfoIsProcessing());
      final GetUserParam param = GetUserParam();
      final response = await _getUserUsecase.trigger(param);
      response.fold((l) {
        emit(UserInfoFailed(l.getError()));
        _showError(l.getError());
      }, (r) {
        emit(UserInfoDone(r));
      });
    });
  }

  void _showError(String message) {
    navKey.currentContext!.showSnackBar(SnackBar(
        content: message.light(color: locator.get<IAppColors>().white)));
  }
}

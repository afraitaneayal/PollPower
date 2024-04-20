import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:poll_power/domain/params/user/get_user_param.dart';
import 'package:poll_power/domain/usecases/user/get_user_usecase.dart';
import 'package:poll_power/presentation/state_management/bloc/user/user_event.dart';
import 'package:poll_power/presentation/state_management/bloc/user/user_state.dart';

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
      }, (r) {
        emit(UserInfoDone(r));
      });
    });
  }
}

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:poll_power/domain/entities/user/user.dart';
import 'package:poll_power/domain/params/user/create_user_param.dart';
import 'package:poll_power/domain/params/user/log_user_param.dart';
import 'package:poll_power/domain/usecases/user/create_user_usecase.dart';
import 'package:poll_power/domain/usecases/user/log_user_uscase.dart';
import 'package:poll_power/presentation/state_management/bloc/auth/auth_events.dart';
import 'package:poll_power/presentation/state_management/bloc/auth/auth_states.dart';

@singleton
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final CreateUserUsecase _createUserUsecase;
  final LogUserUsecase _logUserUsecase;

  AuthBloc(this._createUserUsecase, this._logUserUsecase)
      : super(AuthInitialState()) {
    _mapEvents();
  }

  Future<void> _mapEvents() async {
    // On Signup user event
    on<SignUpUserEvent>((event, emit) async {
      final UserEntity user = event.user;
      final CreateUserParam param = CreateUserParam(
          user.email,
          user.area_of_study,
          user.grade,
          user.image,
          user.last_name,
          user.first_name,
          user.password);
      final result = await _createUserUsecase.trigger(param);
      result.fold(
          (l) => emit(AuthFailed("Signup user failed verify your credentials")),
          (r) => emit(SignUpDone(r)));
    });

    // On Signup user event
    on<LoginUserEvent>((event, emit) async {
      final LogUserParam param =
          LogUserParam(event.user.email, event.user.password);
      final result = await _logUserUsecase.trigger(param);
      result.fold(
          (l) => emit(AuthFailed("Login user failed verify your credentials")),
          (r) => emit(LoginDone(r)));
    });
  }
}

import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:poll_power/core/common/app_route.dart';
import 'package:poll_power/core/extensions/context_extension.dart';
import 'package:poll_power/core/extensions/string_extension.dart';
import 'package:poll_power/core/helpers/token_helper.dart';
import 'package:poll_power/core/ui/theme/colors/i_app_colors.dart';
import 'package:poll_power/di.dart';
import 'package:poll_power/domain/entities/candidate/candidate.dart';
import 'package:poll_power/domain/entities/user/user.dart';
import 'package:poll_power/domain/objects/jwt_object.dart';
import 'package:poll_power/domain/params/candidate/create_candidate_param.dart';
import 'package:poll_power/domain/params/user/create_user_param.dart';
import 'package:poll_power/domain/params/user/log_user_param.dart';
import 'package:poll_power/domain/usecases/candidate/create_candidate_usecase.dart';
import 'package:poll_power/domain/usecases/user/create_user_usecase.dart';
import 'package:poll_power/domain/usecases/user/log_user_uscase.dart';
import 'package:poll_power/presentation/state_management/bloc/auth/auth_events.dart';
import 'package:poll_power/presentation/state_management/bloc/auth/auth_states.dart';
import 'package:poll_power/router.dart';

@singleton
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final CreateUserUsecase _createUserUsecase;
  final CreateCandidateUsecase _createCandidateUsecase;
  final LogUserUsecase _logUserUsecase;

  AuthBloc(this._createUserUsecase, this._logUserUsecase,
      this._createCandidateUsecase)
      : super(AuthInitialState()) {
    _mapEvents();
  }

  Future<void> _mapEvents() async {
    // On Signup user event
    on<SignUpUserEvent>((event, emit) async {
      emit(SignUpProcessing());
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
      result.fold((l) {
        emit(AuthFailed("Signup user failed verify your credentials"));
        _showError(l.getError());
      }, (r) {
        emit(SignUpUserDone(r));
        navKey.currentContext!.push(AppRoutes.login);
      });
    });

    // On Signup candidate event
    on<SignUpCandidateEvent>((event, emit) async {
      emit(SignUpProcessing());
      final CandidateEntity candidate = event.candidate;
      final UserEntity user = event.user;
      final CreateCandidateParam param = CreateCandidateParam(
          candidate.slogan, candidate.speech, user, candidate.vote_count);
      final result = await _createCandidateUsecase.trigger(param);
      result.fold((l) {
        emit(AuthFailed("Signup candidate failed verify your credentials"));
        _showError(l.getError());
      }, (r) {
        emit(SignUpCandidateDone(r));
        navKey.currentContext!.push(AppRoutes.login);
      });
    });

    // On login user event
    on<LoginUserEvent>((LoginUserEvent event, Emitter emit) async {
      emit(LoginProcessing());
      final LogUserParam param = LogUserParam(event.email, event.password);
      final result = await _logUserUsecase.trigger(param);
      result.fold((l) {
        emit(AuthFailed("Login user failed verify your credentials"));
        _showError(l.getError());
      }, (r) {
        emit(LoginDone(r));
        _saveCredentials(r);
        navKey.currentContext!.push(AppRoutes.home);
      });
    });
  }

  void _showError(String message) {
    navKey.currentContext!.showSnackBar(SnackBar(
        content: message.light(color: locator.get<IAppColors>().white)));
  }

  Future<bool> isUserAuthenticated() async {
    return locator.get<TokenHelper>().isAuthenticated();
  }

  void _saveCredentials(JwtObject tokens) {
    log("Saving credentials");
    log(tokens.token);
    locator.get<TokenHelper>().saveTokens(tokens);
  }

  Future<void> logout() async {
    locator.get<TokenHelper>().removeCredentials();
    navKey.currentContext!.push(AppRoutes.login);
  }
}

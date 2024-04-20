import 'package:equatable/equatable.dart';
import 'package:poll_power/domain/entities/user/user.dart';

abstract class UserState extends Equatable {}

class UserInitialState extends UserState {
  @override
  List<Object?> get props => [];
}

class GetUserInfoIsProcessing extends UserState {
  @override
  List<Object?> get props => [];
}

class UserInfoDone extends UserState {
  final UserEntity user;
  UserInfoDone(this.user);

  @override
  List<Object?> get props => [user];
}

class UserInfoFailed extends UserState {
  final String message;
  UserInfoFailed(this.message);

  @override
  List<Object?> get props => [message];
}

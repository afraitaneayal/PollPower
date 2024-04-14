import 'package:equatable/equatable.dart';
import 'package:poll_power/domain/entities/user/user.dart';

abstract class AuthEvent extends Equatable {}

class LoginUserEvent extends AuthEvent {
  final UserEntity user;
  LoginUserEvent(this.user);

  @override
  List<Object?> get props => [user];
}

class SignUpUserEvent extends AuthEvent {
  final UserEntity user;
  SignUpUserEvent(this.user);

  @override
  List<Object?> get props => [user];
}

import 'package:equatable/equatable.dart';
import 'package:poll_power/domain/entities/user/user.dart';
import 'package:poll_power/domain/objects/jwt_object.dart';

abstract class AuthState extends Equatable {}

class AuthInitialState extends AuthState {
  @override
  List<Object?> get props => [];
}

class LoginProcessing extends AuthState {
  @override
  List<Object?> get props => [];
}

class SignUpProcessing extends AuthState {
  @override
  List<Object?> get props => [];
}

class LoginDone extends AuthState {
  final JwtObject jwt;
  LoginDone(this.jwt);

  @override
  List<Object?> get props => [jwt];
}

class SignUpDone extends AuthState {
  final UserEntity user;
  SignUpDone(this.user);

  @override
  List<Object?> get props => [user];
}

class AuthFailed extends AuthState {
  final String message;
  AuthFailed(this.message);

  @override
  List<Object?> get props => [message];
}

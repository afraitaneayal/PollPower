import 'package:equatable/equatable.dart';
import 'package:poll_power/domain/entities/candidate/candidate.dart';
import 'package:poll_power/domain/entities/user/user.dart';

abstract class AuthEvent extends Equatable {}

class LoginUserEvent extends AuthEvent {
  final String email;
  final String password;
  LoginUserEvent({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}

class SignUpUserEvent extends AuthEvent {
  final UserEntity user;
  SignUpUserEvent(this.user);

  @override
  List<Object?> get props => [user];
}

class SignUpCandidateEvent extends AuthEvent {
  final CandidateEntity candidate;
  final UserEntity user;
  SignUpCandidateEvent(this.candidate, this.user);

  @override
  List<Object?> get props => [candidate, user];
}

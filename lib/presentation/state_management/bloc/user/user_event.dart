import 'package:equatable/equatable.dart';

abstract class UserEvent extends Equatable {}

class GetUserInfoEvent extends UserEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}

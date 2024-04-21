import 'package:equatable/equatable.dart';

abstract class CandidateEvent extends Equatable {}

class GetCandidatesEvent extends CandidateEvent {
  GetCandidatesEvent();

  @override
  List<Object?> get props => [];
}

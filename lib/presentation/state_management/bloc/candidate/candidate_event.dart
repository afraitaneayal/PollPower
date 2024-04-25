import 'package:equatable/equatable.dart';

abstract class CandidateEvent extends Equatable {}

class GetCandidatesEvent extends CandidateEvent {
  GetCandidatesEvent();

  @override
  List<Object?> get props => [];
}

class VoteCandidateEvent extends CandidateEvent {
  final String candidateUuid;
  VoteCandidateEvent(this.candidateUuid);

  @override
  List<Object?> get props => [candidateUuid];
}

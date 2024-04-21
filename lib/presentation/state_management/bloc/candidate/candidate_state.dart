import 'package:equatable/equatable.dart';
import 'package:poll_power/domain/entities/candidate/candidate.dart';

abstract class CandidateState extends Equatable {}

class CandidateInitialState extends CandidateState {
  @override
  List<Object?> get props => [];
}

class GetCandidateIsProcessing extends CandidateState {
  @override
  List<Object?> get props => [];
}

class GetCandidatesFailed extends CandidateState {
  final String error;
  GetCandidatesFailed(this.error);

  @override
  List<Object?> get props => [error];
}

class GetCandidatesDone extends CandidateState {
  final List<CandidateEntity> candidates;
  GetCandidatesDone(this.candidates);

  @override
  List<Object?> get props => [candidates];
}

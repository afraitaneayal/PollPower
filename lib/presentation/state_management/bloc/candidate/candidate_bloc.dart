
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:poll_power/domain/entities/candidate/candidate.dart';
import 'package:poll_power/domain/usecases/candidate/get_all_candidate_usecase.dart';
import 'package:poll_power/presentation/state_management/bloc/candidate/candidate_event.dart';
import 'package:poll_power/presentation/state_management/bloc/candidate/candidate_state.dart';


@singleton
class CandidateBloc extends Bloc<CandidateEvent, CandidateState> {
  final GetAllCandidateUsecase _allCandidateUsecase;
  late List<CandidateEntity> candidatesList = <CandidateEntity>[];
  List<CandidateEntity> get candidates => candidatesList;

  CandidateBloc(this._allCandidateUsecase) : super(CandidateInitialState()) {
    _mapEvent();
  }

  Future<void> _mapEvent() async {
    on<GetCandidatesEvent>((GetCandidatesEvent event, Emitter emit) async {
      emit(GetCandidateIsProcessing());
      final result = await _allCandidateUsecase.trigger(null);
      result.fold((l) {
        emit(GetCandidatesFailed(l.getError()));
      }, (r) async {
        emit(GetCandidatesDone(r));
        candidatesList = r;
      });
    });
  }

  CandidateEntity? getCandidate(String uuid) {
    return candidates.firstWhere((element) => element.uuid == uuid);
  }
}

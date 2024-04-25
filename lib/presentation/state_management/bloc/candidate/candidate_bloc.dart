import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:poll_power/core/extensions/context_extension.dart';
import 'package:poll_power/core/extensions/string_extension.dart';
import 'package:poll_power/core/ui/theme/colors/i_app_colors.dart';
import 'package:poll_power/di.dart';
import 'package:poll_power/domain/entities/candidate/candidate.dart';
import 'package:poll_power/domain/params/candidate/vote_candidate_param.dart';
import 'package:poll_power/domain/usecases/candidate/get_all_candidate_usecase.dart';
import 'package:poll_power/domain/usecases/candidate/vote_candidate_usecase.dart';
import 'package:poll_power/presentation/state_management/bloc/candidate/candidate_event.dart';
import 'package:poll_power/presentation/state_management/bloc/candidate/candidate_state.dart';
import 'package:poll_power/router.dart';

@singleton
class CandidateBloc extends Bloc<CandidateEvent, CandidateState> {
  final GetAllCandidateUsecase _allCandidateUsecase;
  final VoteCandidateUsecase _voteCandidateUsecase;
  late List<CandidateEntity> candidatesList = <CandidateEntity>[];
  List<CandidateEntity> get candidates => candidatesList;

  CandidateBloc(this._allCandidateUsecase, this._voteCandidateUsecase)
      : super(CandidateInitialState()) {
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

    on<VoteCandidateEvent>((VoteCandidateEvent event, Emitter emit) async {
      emit(VoteCandidateProcessing());
      final VoteCandidateParam param = VoteCandidateParam(event.candidateUuid);
      final result = await _voteCandidateUsecase.trigger(param);
      result.fold((l) {
        emit(VoteCandidateFailed(l.getError()));
        navKey.currentContext!.showSnackBar(SnackBar(
            content:
                l.getError().light(color: locator.get<IAppColors>().white)));
      }, (r) {
        emit(VoteCandidateDone());
        navKey.currentContext!.showSnackBar(SnackBar(
            content: "Successfuly voted"
                .light(color: locator.get<IAppColors>().white)));
      });
    });
  }

  CandidateEntity? getCandidate(String uuid) {
    return candidates.firstWhere((element) => element.uuid == uuid);
  }
}

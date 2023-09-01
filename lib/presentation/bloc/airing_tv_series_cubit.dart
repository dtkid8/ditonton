import 'package:ditonton/presentation/bloc/general_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/tv_series.dart';
import '../../domain/usecases/get_now_playing_tv_series.dart';

class AiringTvSeriesCubit extends Cubit<GeneralState> {
  final GetNowPlayingTvSeries getAiringTvSeries;
  AiringTvSeriesCubit({
    required this.getAiringTvSeries,
  }) : super(GeneralInitializeState());

  List<TvSeries> _tvSeries = [];
  List<TvSeries> get tvSeries => _tvSeries;

  String _message = '';
  String get message => _message;

  Future<void> fetchAiringTvSeries() async {
    emit(GeneralLoadingState());
    final result = await getAiringTvSeries.execute();

    result.fold(
      (failure) {
        _message = failure.message;
        emit(GeneralErrorState(message));
      },
      (series) {
        _tvSeries = series;
        emit(GeneralLoadedState(_tvSeries));
      },
    );
  }
}

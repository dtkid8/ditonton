import 'package:ditonton/presentation/bloc/general_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/tv_series.dart';
import '../../domain/usecases/get_watchlist_series.dart';

class WatchlistSeriesCubit extends Cubit<GeneralState> {
  final GetWatchlistSeries getWatchlistSeries;
  WatchlistSeriesCubit({
    required this.getWatchlistSeries,
  }) : super(GeneralInitializeState());

  List<TvSeries> _tvSeries = [];
  List<TvSeries> get tvSeries => _tvSeries;

  String _message = '';
  String get message => _message;

  Future<void> fetchWatchlistSeries() async {
    emit(GeneralLoadingState());
    final result = await getWatchlistSeries.execute();

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

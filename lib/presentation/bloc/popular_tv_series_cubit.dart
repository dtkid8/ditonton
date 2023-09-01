import 'package:ditonton/presentation/bloc/general_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/tv_series.dart';
import '../../domain/usecases/get_popular_tv_series.dart';

class PopularTvSeriesCubit extends Cubit<GeneralState> {
  final GetPopularTvSeries getPopularTvSeries;
  PopularTvSeriesCubit({
    required this.getPopularTvSeries,
  }) : super(GeneralInitializeState());

  List<TvSeries> _tvSeries = [];
  List<TvSeries> get tvSeries => _tvSeries;

  String _message = '';
  String get message => _message;

  Future<void> fetchPopularTvSeries() async {
    emit(GeneralLoadingState());
    final result = await getPopularTvSeries.execute();

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

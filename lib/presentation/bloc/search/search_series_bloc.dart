import 'package:ditonton/presentation/bloc/general_state.dart';
import 'package:ditonton/presentation/bloc/search/search_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

import '../../../domain/usecases/search_tv_series.dart';

EventTransformer<T> debounce<T>(Duration duration) {
  return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
}

class SearchSeriesBloc extends Bloc<SearchEvent, GeneralState> {
  final SearchTvSeries _searchSeries;

  SearchSeriesBloc(this._searchSeries) : super(GeneralInitializeState()) {
    on<OnQueryChanged>((event, emit) async {
      final query = event.query;

      emit(GeneralLoadingState());
      final result = await _searchSeries.execute(query);

      result.fold(
        (failure) {
          emit(GeneralErrorState(failure.message));
        },
        (data) {
          emit(GeneralLoadedState(data));
        },
      );
    }, transformer: debounce(const Duration(milliseconds: 500)));
  }
}

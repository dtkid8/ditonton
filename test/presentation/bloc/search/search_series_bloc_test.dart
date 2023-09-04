import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/usecases/search_tv_series.dart';
import 'package:ditonton/presentation/bloc/general_state.dart';
import 'package:ditonton/presentation/bloc/search/search_event.dart';
import 'package:ditonton/presentation/bloc/search/search_series_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/tv_series_dummy_objects.dart';
import 'search_series_bloc_test.mocks.dart';

@GenerateMocks([SearchTvSeries])
void main() {
  late MockSearchTvSeries mockSearchTvSeries;
  late SearchSeriesBloc bloc;
  final query = "game";
  setUp(() {
    mockSearchTvSeries = MockSearchTvSeries();
    bloc = SearchSeriesBloc(mockSearchTvSeries);
  });

  test('initial state should be initialize', () {
    expect(bloc.state, GeneralInitializeState());
  });

  blocTest<SearchSeriesBloc, GeneralState>(
    'Should emit [Loading, Loaded] when data is gotten successfully',
    build: () {
      when(mockSearchTvSeries.execute(query)).thenAnswer((_) async => Right(testTvSeriesList));
      return bloc;
    },
    act: (bloc) => bloc.add(OnQueryChanged(query)),
    expect: () => [
      GeneralLoadingState(),
      GeneralLoadedState(testTvSeriesList),
    ],
    wait: const Duration(milliseconds: 500),
    verify: (bloc) {
      verify(mockSearchTvSeries.execute(query));
    },
  );

  blocTest<SearchSeriesBloc, GeneralState>(
    'Should emit [Loading, Error] when get search is unsuccessful',
    build: () {
      when(mockSearchTvSeries.execute(query)).thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      return bloc;
    },
    act: (bloc) => bloc.add(OnQueryChanged(query)),
    expect: () => [
      GeneralLoadingState(),
      GeneralErrorState('Server Failure'),
    ],
    wait: const Duration(milliseconds: 500),
    verify: (bloc) {
      verify(mockSearchTvSeries.execute(query));
    },
  );
}

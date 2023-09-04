import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/usecases/get_top_rated_tv_series.dart';
import 'package:ditonton/presentation/bloc/general_state.dart';
import 'package:ditonton/presentation/bloc/top_rated_tv_series_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import '../../dummy_data/tv_series_dummy_objects.dart';
import 'top_rated_tv_series_cubit_test.mocks.dart';

@GenerateMocks([GetTopRatedTvSeries])
void main() {
  late MockGetTopRatedTvSeries mockGetTopRatedTvSeries;
  late TopRatedTvSeriesCubit cubit;

  setUp(() {
    mockGetTopRatedTvSeries = MockGetTopRatedTvSeries();
    cubit = TopRatedTvSeriesCubit(getTopRatedTvSeries: mockGetTopRatedTvSeries);
  });

  test('initial state should be initialize', () {
    expect(cubit.state, GeneralInitializeState());
    expect(cubit.tvSeries, []);
  });

  blocTest<TopRatedTvSeriesCubit, GeneralState>(
    'Should emit [Loading, Loaded] when data is gotten successfully',
    build: () {
      when(mockGetTopRatedTvSeries.execute()).thenAnswer((_) async => Right(testTvSeriesList));
      return cubit;
    },
    act: (cubit) => cubit.fetchTopRatedTvSeries(),
    expect: () => [
      GeneralLoadingState(),
      GeneralLoadedState(testTvSeriesList),
    ],
    verify: (bloc) {
      verify(mockGetTopRatedTvSeries.execute());
    },
  );

  blocTest<TopRatedTvSeriesCubit, GeneralState>(
    'Should emit [Loading, Error] when get search is unsuccessful',
    build: () {
      when(mockGetTopRatedTvSeries.execute()).thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      return cubit;
    },
    act: (bloc) => bloc.fetchTopRatedTvSeries(),
    expect: () => [
      GeneralLoadingState(),
      GeneralErrorState('Server Failure'),
    ],
    verify: (bloc) {
      verify(mockGetTopRatedTvSeries.execute());
    },
  );
}

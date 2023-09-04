import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/usecases/get_now_playing_movies.dart';
import 'package:ditonton/presentation/bloc/general_state.dart';
import 'package:ditonton/presentation/bloc/now_playing_movies_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import '../../dummy_data/dummy_objects.dart';
import 'now_playing_movies_cubit_test.mocks.dart';

@GenerateMocks([GetNowPlayingMovies])
void main() {
  late MockGetNowPlayingMovies mockGetNowPlayingMovies;
  late NowPlayingMoviesCubit cubit;

  setUp(() {
    mockGetNowPlayingMovies = MockGetNowPlayingMovies();
    cubit = NowPlayingMoviesCubit(getNowPlayingMovies: mockGetNowPlayingMovies);
  });

  test('initial state should be initialize', () {
    expect(cubit.state, GeneralInitializeState());
    expect(cubit.movie, []);
  });

  blocTest<NowPlayingMoviesCubit, GeneralState>(
    'Should emit [Loading, Loaded] when data is gotten successfully',
    build: () {
      when(mockGetNowPlayingMovies.execute()).thenAnswer((_) async => Right(testMovieList));
      return cubit;
    },
    act: (cubit) => cubit.fetchNowPlayingMovies(),
    expect: () => [
      GeneralLoadingState(),
      GeneralLoadedState(testMovieList),
    ],
    verify: (bloc) {
      verify(mockGetNowPlayingMovies.execute());
    },
  );

  blocTest<NowPlayingMoviesCubit, GeneralState>(
    'Should emit [Loading, Error] when get search is unsuccessful',
    build: () {
      when(mockGetNowPlayingMovies.execute()).thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      return cubit;
    },
    act: (bloc) => bloc.fetchNowPlayingMovies(),
    expect: () => [
      GeneralLoadingState(),
      GeneralErrorState('Server Failure'),
    ],
    verify: (bloc) {
      verify(mockGetNowPlayingMovies.execute());
    },
  );
}
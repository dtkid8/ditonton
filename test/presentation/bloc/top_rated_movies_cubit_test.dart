import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/usecases/get_top_rated_movies.dart';
import 'package:ditonton/presentation/bloc/general_state.dart';
import 'package:ditonton/presentation/bloc/top_rated_movies_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import '../../dummy_data/dummy_objects.dart';
import 'top_rated_movies_cubit_test.mocks.dart';

@GenerateMocks([GetTopRatedMovies])
void main() {
  late MockGetTopRatedMovies mockGetTopRatedMovies;
  late TopRatedMoviesCubit cubit;

  setUp(() {
    mockGetTopRatedMovies = MockGetTopRatedMovies();
    cubit = TopRatedMoviesCubit(getTopRatedMovies: mockGetTopRatedMovies);
  });

  test('initial state should be initialize', () {
    expect(cubit.state, GeneralInitializeState());
    expect(cubit.movie, []);
  });

  blocTest<TopRatedMoviesCubit, GeneralState>(
    'Should emit [Loading, Loaded] when data is gotten successfully',
    build: () {
      when(mockGetTopRatedMovies.execute()).thenAnswer((_) async => Right(testMovieList));
      return cubit;
    },
    act: (cubit) => cubit.fetchTopRatedMovies(),
    expect: () => [
      GeneralLoadingState(),
      GeneralLoadedState(testMovieList),
    ],
    verify: (bloc) {
      verify(mockGetTopRatedMovies.execute());
    },
  );

  blocTest<TopRatedMoviesCubit, GeneralState>(
    'Should emit [Loading, Error] when get search is unsuccessful',
    build: () {
      when(mockGetTopRatedMovies.execute()).thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      return cubit;
    },
    act: (bloc) => bloc.fetchTopRatedMovies(),
    expect: () => [
      GeneralLoadingState(),
      GeneralErrorState('Server Failure'),
    ],
    verify: (bloc) {
      verify(mockGetTopRatedMovies.execute());
    },
  );
}
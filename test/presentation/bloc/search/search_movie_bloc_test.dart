import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/usecases/search_movies.dart';
import 'package:ditonton/presentation/bloc/general_state.dart';
import 'package:ditonton/presentation/bloc/search/search_event.dart';
import 'package:ditonton/presentation/bloc/search/search_movie_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/dummy_objects.dart';
import 'search_movie_bloc_test.mocks.dart';

@GenerateMocks([SearchMovies])
void main() {
  late MockSearchMovies mockSearchMovie;
  late SearchMovieBloc bloc;
  final query = "game";
  setUp(() {
    mockSearchMovie = MockSearchMovies();
    bloc = SearchMovieBloc(mockSearchMovie);
  });

  test('initial state should be initialize', () {
    expect(bloc.state, GeneralInitializeState());
  });

  blocTest<SearchMovieBloc, GeneralState>(
    'Should emit [Loading, Loaded] when data is gotten successfully',
    build: () {
      when(mockSearchMovie.execute(query)).thenAnswer((_) async => Right(testMovieList));
      return bloc;
    },
    act: (bloc) => bloc.add(OnQueryChanged(query)),
    expect: () => [
      GeneralLoadingState(),
      GeneralLoadedState(testMovieList),
    ],
    wait: const Duration(milliseconds: 500),
    verify: (bloc) {
      verify(mockSearchMovie.execute(query));
    },
  );

  blocTest<SearchMovieBloc, GeneralState>(
    'Should emit [Loading, Error] when get search is unsuccessful',
    build: () {
      when(mockSearchMovie.execute(query)).thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      return bloc;
    },
    act: (bloc) => bloc.add(OnQueryChanged(query)),
    expect: () => [
      GeneralLoadingState(),
      GeneralErrorState('Server Failure'),
    ],
    wait: const Duration(milliseconds: 500),
    verify: (bloc) {
      verify(mockSearchMovie.execute(query));
    },
  );
}

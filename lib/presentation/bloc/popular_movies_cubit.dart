import 'package:ditonton/presentation/bloc/general_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/movie.dart';
import '../../domain/usecases/get_popular_movies.dart';

class PopularMoviesCubit extends Cubit<GeneralState> {
  final GetPopularMovies getPopularMovies;
  PopularMoviesCubit({
    required this.getPopularMovies,
  }) : super(GeneralInitializeState());

  List<Movie> _movie = [];
  List<Movie> get movie => _movie;

  String _message = '';
  String get message => _message;

  Future<void> fetchPopularMovies() async {
    emit(GeneralLoadingState());
    final result = await getPopularMovies.execute();

    result.fold(
      (failure) {
        _message = failure.message;
        emit(GeneralErrorState(message));
      },
      (movie) {
        _movie = movie;
        emit(GeneralLoadedState(_movie));
      },
    );
  }
}

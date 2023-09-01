import 'package:ditonton/presentation/bloc/general_state.dart';
import 'package:ditonton/domain/usecases/get_watchlist_movies.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/movie.dart';

class WatchlistMoviesCubit extends Cubit<GeneralState> {
  final GetWatchlistMovies getWatchlistMovie;
  WatchlistMoviesCubit({
    required this.getWatchlistMovie,
  }) : super(GeneralInitializeState());

  List<Movie> _movie = [];
  List<Movie> get movie => _movie;

  String _message = '';
  String get message => _message;

  Future<void> fetchWatchlistMovies() async {
    emit(GeneralLoadingState());
    final result = await getWatchlistMovie.execute();

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

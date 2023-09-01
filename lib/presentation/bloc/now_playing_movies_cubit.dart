import 'package:ditonton/presentation/bloc/general_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/movie.dart';
import '../../domain/usecases/get_now_playing_movies.dart';

class NowPlayingMoviesCubit extends Cubit<GeneralState> {
  final GetNowPlayingMovies getNowPlayingMovies;
  NowPlayingMoviesCubit({
    required this.getNowPlayingMovies,
  }) : super(GeneralInitializeState());

  List<Movie> _movie = [];
  List<Movie> get movie => _movie;

  String _message = '';
  String get message => _message;

  Future<void> fetchNowPlayingMovies() async {
    emit(GeneralLoadingState());
    final result = await getNowPlayingMovies.execute();

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

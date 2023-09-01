import 'package:ditonton/presentation/bloc/general_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/movie.dart';
import '../../domain/usecases/get_top_rated_movies.dart';

class TopRatedMoviesCubit extends Cubit<GeneralState> {
  final GetTopRatedMovies getTopRatedMovies;
  TopRatedMoviesCubit({
    required this.getTopRatedMovies,
  }) : super(GeneralInitializeState());

  List<Movie> _movie = [];
  List<Movie> get movie => _movie;

  String _message = '';
  String get message => _message;

  Future<void> fetchTopRatedMovies() async {
    emit(GeneralLoadingState());
    final result = await getTopRatedMovies.execute();

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

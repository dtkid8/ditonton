import 'package:ditonton/presentation/bloc/detail_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/movie.dart';
import '../../domain/entities/movie_detail.dart';
import '../../domain/usecases/get_movie_detail.dart';
import '../../domain/usecases/get_movie_recommendations.dart';
import '../../domain/usecases/get_watchlist_status.dart';
import '../../domain/usecases/remove_watchlist.dart';
import '../../domain/usecases/save_watchlist.dart';

class MovieDetailCubit extends Cubit<DetailState> {
  static const watchlistAddSuccessMessage = 'Added to Watchlist';
  static const watchlistRemoveSuccessMessage = 'Removed from Watchlist';

  final GetMovieDetail getMovieDetail;
  final GetMovieRecommendations getMovieRecommendations;
  final GetWatchListStatus getWatchListStatus;
  final SaveWatchlist saveWatchlist;
  final RemoveWatchlist removeWatchlist;

  MovieDetailCubit({
    required this.getMovieDetail,
    required this.getMovieRecommendations,
    required this.getWatchListStatus,
    required this.saveWatchlist,
    required this.removeWatchlist,
  }) : super(DetailInitializeState());

  MovieDetail _movie = MovieDetail(
    adult: false,
    backdropPath: "",
    genres: [],
    id: 0,
    overview: "",
    posterPath: "",
    voteAverage: 0,
    voteCount: 0,
    originalTitle: '',
    releaseDate: '',
    runtime: 0,
    title: '',
  );

  MovieDetail get movie => _movie;

  String _message = '';
  String get message => _message;

  List<Movie> _movieRecommendations = [];
  List<Movie> get movieRecommendations => _movieRecommendations;

  Future<void> fetchMovieDetail(int id) async {
    emit(DetailLoadingState());
    final result = await getMovieDetail.execute(id);
    final recommendationResult = await getMovieRecommendations.execute(id);
    result.fold(
      (failure) {
        _message = failure.message;
        emit(DetailErrorState(message));
      },
      (movie) {
        _movie = movie;
        recommendationResult.fold(
          (failure) {
            _message = failure.message;
            emit(DetailErrorState(message));
          },
          (movieRecommendation) {
            _movieRecommendations = movieRecommendation;
            emit(DetailLoadedState(DateTime.now()));
          },
        );
      },
    );
  }

  bool _isAddedtoWatchlist = false;
  bool get isAddedToWatchlist => _isAddedtoWatchlist;

  String _watchlistMessage = '';
  String get watchlistMessage => _watchlistMessage;

  Future<void> loadWatchlistStatus(int id) async {
    final result = await getWatchListStatus.execute(id);
    _isAddedtoWatchlist = result;
    emit(DetailLoadedState(DateTime.now()));
  }

  Future<void> addWatchlist(MovieDetail movie) async {
    final result = await saveWatchlist.execute(movie);

    await result.fold(
      (failure) async {
        _watchlistMessage = failure.message;
      },
      (successMessage) async {
        _watchlistMessage = successMessage;
      },
    );

    emit(DetailWatchlistState(_watchlistMessage));

    await loadWatchlistStatus(movie.id);
  }

  Future<void> removeFromWatchlist(MovieDetail movie) async {
    final result = await removeWatchlist.execute(movie);

    await result.fold(
      (failure) async {
        _watchlistMessage = failure.message;
      },
      (successMessage) async {
        _watchlistMessage = successMessage;
      },
    );
    emit(DetailWatchlistState(_watchlistMessage));

    await loadWatchlistStatus(movie.id);
  }
}

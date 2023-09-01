import 'package:ditonton/presentation/bloc/detail_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/tv_series.dart';
import '../../domain/entities/tv_series_detail.dart';
import '../../domain/usecases/get_tv_series_detail.dart';
import '../../domain/usecases/get_tv_series_recommendations.dart';
import '../../domain/usecases/get_watchlist_series_status.dart';
import '../../domain/usecases/remove_series_watchlist.dart';
import '../../domain/usecases/save_watchlist_series.dart';

class TvSeriesDetailCubit extends Cubit<DetailState> {
  static const watchlistAddSuccessMessage = 'Added to Watchlist';
  static const watchlistRemoveSuccessMessage = 'Removed from Watchlist';

  final GetTvSeriesDetail getTvSeriesDetail;
  final GetTvSeriesRecommendations getTvSeriesRecommendations;
  final GetWatchListSeriesStatus getWatchListStatus;
  final SaveWatchlistSeries saveWatchlist;
  final RemoveSeriesWatchlist removeWatchlist;

  TvSeriesDetailCubit({
    required this.getTvSeriesDetail,
    required this.getTvSeriesRecommendations,
    required this.getWatchListStatus,
    required this.saveWatchlist,
    required this.removeWatchlist,
  }) : super(DetailInitializeState());

  TvSeriesDetail _tvSeries = TvSeriesDetail(
    adult: false,
    backdropPath: "",
    episodeRunTime: [],
    firstAirDate: "",
    genres: [],
    homepage: "",
    id: 0,
    inProduction: false,
    languages: [],
    lastAirDate: "",
    name: "",
    networks: [],
    numberOfEpisodes: 0,
    numberOfSeasons: 0,
    originCountry: [],
    originalLanguage: "",
    originalName: "",
    overview: "",
    popularity: 0,
    posterPath: "",
    spokenLanguages: [],
    status: "",
    tagline: "",
    type: "",
    voteAverage: 0,
    voteCount: 0,
  );
  TvSeriesDetail get tvSeries => _tvSeries;

  String _message = '';
  String get message => _message;

  List<TvSeries> _seriesRecommendations = [];
  List<TvSeries> get seriesRecommendations => _seriesRecommendations;

  Future<void> fetchTvSeriesDetail(int id) async {
    emit(DetailLoadingState());
    final result = await getTvSeriesDetail.execute(id);
    final recommendationResult = await getTvSeriesRecommendations.execute(id);
    result.fold(
      (failure) {
        _message = failure.message;
        emit(DetailErrorState(message));
      },
      (series) {
        _tvSeries = series;
        emit(DetailLoadingState());
        recommendationResult.fold(
          (failure) {
            _message = failure.message;
            emit(DetailErrorState(message));
          },
          (seriesRecommendation) {
            _seriesRecommendations = seriesRecommendation;
          },
        );
        emit(DetailLoadedState(DateTime.now()));
      },
    );
  }

  bool _isAddedtoWatchlist = false;
  bool get isAddedToWatchlist => _isAddedtoWatchlist;

  String _watchlistMessage = '';
  String get watchlistMessage => _watchlistMessage;

  Future<void> loadWatchlistSeriesStatus(int id) async {
    final result = await getWatchListStatus.execute(id);
    _isAddedtoWatchlist = result;
    emit(DetailLoadedState(DateTime.now()));
  }

  Future<void> addWatchlist(TvSeriesDetail movie) async {
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

    await loadWatchlistSeriesStatus(movie.id);
  }

  Future<void> removeFromWatchlist(TvSeriesDetail movie) async {
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

    await loadWatchlistSeriesStatus(movie.id);
  }
}

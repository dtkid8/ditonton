import 'dart:io';
import 'package:ditonton/data/datasources/db/database_helper.dart';
import 'package:ditonton/data/datasources/movie_local_data_source.dart';
import 'package:ditonton/data/datasources/movie_remote_data_source.dart';
import 'package:ditonton/data/repositories/movie_repository_impl.dart';
import 'package:ditonton/data/repositories/tv_series_repository_impl.dart';
import 'package:ditonton/domain/repositories/movie_repository.dart';
import 'package:ditonton/domain/usecases/get_movie_detail.dart';
import 'package:ditonton/domain/usecases/get_movie_recommendations.dart';
import 'package:ditonton/domain/usecases/get_now_playing_movies.dart';
import 'package:ditonton/domain/usecases/get_popular_movies.dart';
import 'package:ditonton/domain/usecases/get_top_rated_movies.dart';
import 'package:ditonton/domain/usecases/get_tv_series_recommendations.dart';
import 'package:ditonton/domain/usecases/get_watchlist_movies.dart';
import 'package:ditonton/domain/usecases/get_watchlist_status.dart';
import 'package:ditonton/domain/usecases/remove_series_watchlist.dart';
import 'package:ditonton/domain/usecases/remove_watchlist.dart';
import 'package:ditonton/domain/usecases/save_watchlist.dart';
import 'package:ditonton/domain/usecases/search_movies.dart';
import 'package:ditonton/domain/usecases/search_tv_series.dart';
import 'package:ditonton/presentation/bloc/airing_tv_series_cubit.dart';
import 'package:ditonton/presentation/bloc/now_playing_movies_cubit.dart';
import 'package:ditonton/presentation/bloc/popular_movies_cubit.dart';
import 'package:ditonton/presentation/bloc/popular_tv_series_cubit.dart';
import 'package:ditonton/presentation/bloc/search/search_movie_bloc.dart';
import 'package:ditonton/presentation/bloc/search/search_series_bloc.dart';
import 'package:ditonton/presentation/bloc/top_rated_movies_cubit.dart';
import 'package:ditonton/presentation/bloc/top_rated_tv_series_cubit.dart';
import 'package:ditonton/presentation/bloc/tv_series_detail_cubit.dart';
import 'package:ditonton/presentation/bloc/watchlist_movies_cubit.dart';
import 'package:ditonton/presentation/bloc/watchlist_series_cubit.dart';
import 'package:ditonton/presentation/provider/airing_tv_series_notifier.dart';
import 'package:ditonton/presentation/provider/movie_detail_notifier.dart';
import 'package:ditonton/presentation/provider/movie_list_notifier.dart';
import 'package:ditonton/presentation/provider/movie_search_notifier.dart';
import 'package:ditonton/presentation/provider/popular_movies_notifier.dart';
import 'package:ditonton/presentation/provider/popular_tv_series_notifier.dart';
import 'package:ditonton/presentation/provider/top_rated_movies_notifier.dart';
import 'package:ditonton/presentation/provider/top_rated_tv_series_notifier.dart';
import 'package:ditonton/presentation/provider/tv_series_detail_notifier.dart';
import 'package:ditonton/presentation/provider/tv_series_search_notifier.dart';
import 'package:ditonton/presentation/provider/watchlist_movie_notifier.dart';
import 'package:ditonton/presentation/provider/watchlist_series_notifier.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';
import 'package:http/io_client.dart';

import 'data/datasources/tv_series_local_data_source.dart';
import 'data/datasources/tv_series_remote_data_source.dart';
import 'domain/repositories/tv_series_repository.dart';
import 'domain/usecases/get_now_playing_tv_series.dart';
import 'domain/usecases/get_popular_tv_series.dart';
import 'domain/usecases/get_top_rated_tv_series.dart';
import 'domain/usecases/get_tv_series_detail.dart';
import 'domain/usecases/get_watchlist_series.dart';
import 'domain/usecases/get_watchlist_series_status.dart';
import 'domain/usecases/save_watchlist_series.dart';
import 'presentation/bloc/movie_detail_cubit.dart';
import 'presentation/provider/tv_series_list_notifier.dart';

final locator = GetIt.instance;

Future<void> init() async {
  // provider
  locator.registerFactory(
    () => MovieListNotifier(
      getNowPlayingMovies: locator(),
      getPopularMovies: locator(),
      getTopRatedMovies: locator(),
    ),
  );

  locator.registerFactory(
    () => TvSeriesListNotifier(
      getNowPlayingTvSeries: locator(),
      getPopularTvSeries: locator(),
      getTopRatedTvSeries: locator(),
    ),
  );

  locator.registerFactory(
    () => MovieDetailNotifier(
      getMovieDetail: locator(),
      getMovieRecommendations: locator(),
      getWatchListStatus: locator(),
      saveWatchlist: locator(),
      removeWatchlist: locator(),
    ),
  );
  locator.registerFactory(
    () => MovieSearchNotifier(
      searchMovies: locator(),
    ),
  );
  locator.registerFactory(
    () => PopularMoviesNotifier(
      locator(),
    ),
  );
  locator.registerFactory(
    () => TopRatedMoviesNotifier(
      getTopRatedMovies: locator(),
    ),
  );
  locator.registerFactory(
    () => WatchlistMovieNotifier(
      getWatchlistMovies: locator(),
    ),
  );

  locator.registerFactory(
    () => PopularTvSeriesNotifier(
      locator(),
    ),
  );

  locator.registerFactory(
    () => TopRatedTvSeriesNotifier(
      locator(),
    ),
  );

  locator.registerFactory(
    () => AiringTvSeriesNotifier(
      locator(),
    ),
  );

  locator.registerFactory(
    () => WatchlistSeriesNotifier(getWatchlistSeriess: locator()),
  );

  locator.registerFactory(
    () => TvSeriesDetailNotifier(
      getTvSeriesDetail: locator(),
      getTvSeriesRecommendations: locator(),
      getWatchListStatus: locator(),
      removeWatchlist: locator(),
      saveWatchlist: locator(),
    ),
  );

  locator.registerFactory(
    () => TvSeriesSearchNotifier(
      searchTvSeries: locator(),
    ),
  );

  locator.registerFactory(
    () => AiringTvSeriesCubit(
      getAiringTvSeries: locator(),
    ),
  );

  locator.registerFactory(
    () => NowPlayingMoviesCubit(
      getNowPlayingMovies: locator(),
    ),
  );

  locator.registerFactory(
    () => PopularTvSeriesCubit(
      getPopularTvSeries: locator(),
    ),
  );

  locator.registerFactory(
    () => PopularMoviesCubit(
      getPopularMovies: locator(),
    ),
  );

  locator.registerFactory(
    () => TopRatedTvSeriesCubit(
      getTopRatedTvSeries: locator(),
    ),
  );

  locator.registerFactory(
    () => TopRatedMoviesCubit(
      getTopRatedMovies: locator(),
    ),
  );

  locator.registerFactory(
    () => WatchlistSeriesCubit(
      getWatchlistSeries: locator(),
    ),
  );

  locator.registerFactory(
    () => WatchlistMoviesCubit(
      getWatchlistMovie: locator(),
    ),
  );

  locator.registerFactory(
    () => TvSeriesDetailCubit(
      getTvSeriesDetail: locator(),
      getTvSeriesRecommendations: locator(),
      getWatchListStatus: locator(),
      saveWatchlist: locator(),
      removeWatchlist: locator(),
    ),
  );

  locator.registerFactory(
    () => MovieDetailCubit(
      getWatchListStatus: locator(),
      saveWatchlist: locator(),
      removeWatchlist: locator(),
      getMovieDetail: locator(),
      getMovieRecommendations: locator(),
    ),
  );

  locator.registerFactory(
    () => SearchMovieBloc(locator()),
  );

  locator.registerFactory(
    () => SearchSeriesBloc(locator()),
  );
  // use case
  locator.registerLazySingleton(() => GetNowPlayingMovies(locator()));
  locator.registerLazySingleton(() => GetPopularMovies(locator()));
  locator.registerLazySingleton(() => GetTopRatedMovies(locator()));
  locator.registerLazySingleton(() => GetMovieDetail(locator()));
  locator.registerLazySingleton(() => GetMovieRecommendations(locator()));
  locator.registerLazySingleton(() => SearchMovies(locator()));
  locator.registerLazySingleton(() => GetWatchListStatus(locator()));
  locator.registerLazySingleton(() => SaveWatchlist(locator()));
  locator.registerLazySingleton(() => RemoveWatchlist(locator()));
  locator.registerLazySingleton(() => GetWatchlistMovies(locator()));
  locator.registerLazySingleton(() => GetNowPlayingTvSeries(locator()));
  locator.registerLazySingleton(() => GetPopularTvSeries(locator()));
  locator.registerLazySingleton(() => GetTopRatedTvSeries(locator()));
  locator.registerLazySingleton(() => GetTvSeriesDetail(locator()));
  locator.registerLazySingleton(() => GetTvSeriesRecommendations(locator()));
  locator.registerLazySingleton(() => SearchTvSeries(locator()));
  locator.registerLazySingleton(() => GetWatchListSeriesStatus(locator()));
  locator.registerLazySingleton(() => SaveWatchlistSeries(locator()));
  locator.registerLazySingleton(() => RemoveSeriesWatchlist(locator()));
  locator.registerLazySingleton(() => GetWatchlistSeries(locator()));

  // repository
  locator.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
    ),
  );

  locator.registerLazySingleton<TvSeriesRepository>(
    () => TvSeriesRepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
    ),
  );

  // data sources
  locator.registerLazySingleton<MovieRemoteDataSource>(() => MovieRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<MovieLocalDataSource>(() => MovieLocalDataSourceImpl(databaseHelper: locator()));
  locator.registerLazySingleton<TvSeriesRemoteDataSource>(() => TvSeriesRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<TvSeriesLocalDataSource>(() => TvSeriesLocalDataSourceImpl(databaseHelper: locator()));
  // helper
  locator.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());

  // external
  // locator.registerLazySingleton(() => http.Client());
  await setupClient();
}

setupClient() async {
  final client = await getSSLPinningClient();
  locator.registerLazySingleton(() => client);
}

Future<SecurityContext> get globalContext async {
  final sslCert = await rootBundle.load('certificates/certificate.pem');
  SecurityContext securityContext = SecurityContext(withTrustedRoots: false);
  securityContext.setTrustedCertificatesBytes(sslCert.buffer.asInt8List());
  return securityContext;
}

Future<http.Client> getSSLPinningClient() async {
  HttpClient client = HttpClient(context: await globalContext);
  client.badCertificateCallback = (X509Certificate cert, String host, int port) => false;
  IOClient ioClient = IOClient(client);
  return ioClient;
}

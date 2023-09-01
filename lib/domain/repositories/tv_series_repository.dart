import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';

import '../entities/tv_series.dart';
import '../entities/tv_series_detail.dart';

abstract class TvSeriesRepository {
  Future<Either<Failure, List<TvSeries>>> getNowPlayingTvSeries();
  Future<Either<Failure, List<TvSeries>>> getPopularTvSeries();
  Future<Either<Failure, List<TvSeries>>> getTopRatedTvSeries();
  Future<Either<Failure, TvSeriesDetail>> getDetailTvSeries(int id);
  Future<Either<Failure, List<TvSeries>>> getRecommendationTvSeries(int id);
  Future<Either<Failure, List<TvSeries>>> searchTvSeries(String query);
  Future<Either<Failure, String>> saveWatchlistSeries(TvSeriesDetail series);
  Future<Either<Failure, String>> removeWatchlistSeries(TvSeriesDetail series);
  Future<bool> isAddedToWatchlistSeries(int id);
  Future<Either<Failure, List<TvSeries>>> getWatchlistSeries();
}

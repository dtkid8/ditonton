import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import '../entities/tv_series_detail.dart';
import '../repositories/tv_series_repository.dart';

class RemoveSeriesWatchlist {
  final TvSeriesRepository repository;

  RemoveSeriesWatchlist(this.repository);

  Future<Either<Failure, String>> execute(TvSeriesDetail movie) {
    return repository.removeWatchlistSeries(movie);
  }
}

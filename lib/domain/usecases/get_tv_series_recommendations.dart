import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/entities/tv_series.dart';

import '../../common/failure.dart';
import '../repositories/tv_series_repository.dart';

class GetTvSeriesRecommendations {
  final TvSeriesRepository repository;

  GetTvSeriesRecommendations(this.repository);

  Future<Either<Failure, List<TvSeries>>> execute(int id) {
    return repository.getRecommendationTvSeries(id);
  }
}
import '../repositories/tv_series_repository.dart';

class GetWatchListSeriesStatus {
  final TvSeriesRepository repository;

  GetWatchListSeriesStatus(this.repository);

  Future<bool> execute(int id) async {
    return repository.isAddedToWatchlistSeries(id);
  }
}
import 'package:ditonton/common/exception.dart';
import 'package:ditonton/data/datasources/db/database_helper.dart';

import '../models/tv_series_table.dart';


abstract class TvSeriesLocalDataSource {
  Future<String> insertWatchlistSeries(TvSeriesTable tvSeries);
  Future<String> removeWatchlistSeries(TvSeriesTable tvSeries);
  Future<TvSeriesTable?> getTvSeriesById(int id);
  Future<List<TvSeriesTable>> getWatchlistTvSeries();
}

class TvSeriesLocalDataSourceImpl implements TvSeriesLocalDataSource {
  final DatabaseHelper databaseHelper;

  TvSeriesLocalDataSourceImpl({required this.databaseHelper});

  @override
  Future<String> insertWatchlistSeries(TvSeriesTable tvSeries) async {
    try {
      await databaseHelper.insertWatchlistSeries(tvSeries);
      return 'Added to Watchlist';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<String> removeWatchlistSeries(TvSeriesTable tvSeries) async {
    try {
      await databaseHelper.removeWatchlistSeries(tvSeries);
      return 'Removed from Watchlist';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<TvSeriesTable?> getTvSeriesById(int id) async {
    final result = await databaseHelper.getSeriesById(id);
    if (result != null) {
      return TvSeriesTable.fromMap(result);
    } else {
      return null;
    }
  }

  @override
  Future<List<TvSeriesTable>> getWatchlistTvSeries() async {
    final result = await databaseHelper.getWatchlistSeries();
    return result.map((data) => TvSeriesTable.fromMap(data)).toList();
  }
}
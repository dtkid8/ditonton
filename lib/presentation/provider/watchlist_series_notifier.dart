import 'package:ditonton/common/state_enum.dart';
import 'package:flutter/foundation.dart';
import '../../domain/entities/tv_series.dart';
import '../../domain/usecases/get_watchlist_series.dart';

class WatchlistSeriesNotifier extends ChangeNotifier {
  var _watchlistSeries = <TvSeries>[];
  List<TvSeries> get watchlistSeries => _watchlistSeries;

  var _watchlistState = RequestState.Empty;
  RequestState get watchlistState => _watchlistState;

  String _message = '';
  String get message => _message;

  WatchlistSeriesNotifier({required this.getWatchlistSeriess});

  final GetWatchlistSeries getWatchlistSeriess;

  Future<void> fetchWatchlistSeries() async {
    _watchlistState = RequestState.Loading;
    notifyListeners();

    final result = await getWatchlistSeriess.execute();
    result.fold(
      (failure) {
        _watchlistState = RequestState.Error;
        _message = failure.message;
        notifyListeners();
      },
      (seriesData) {
        _watchlistState = RequestState.Loaded;
        _watchlistSeries = seriesData;
        notifyListeners();
      },
    );
  }
}

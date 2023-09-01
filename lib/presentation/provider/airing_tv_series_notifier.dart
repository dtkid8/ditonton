import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:flutter/foundation.dart';

import '../../domain/usecases/get_now_playing_tv_series.dart';

class AiringTvSeriesNotifier extends ChangeNotifier {
  final GetNowPlayingTvSeries getAiringTvSeries;

  AiringTvSeriesNotifier(this.getAiringTvSeries);

  RequestState _state = RequestState.Empty;
  RequestState get state => _state;

  List<TvSeries> _tvSeries = [];
  List<TvSeries> get tvSeries => _tvSeries;

  String _message = '';
  String get message => _message;

  Future<void> fetchAiringTvSeries() async {
    _state = RequestState.Loading;
    notifyListeners();

    final result = await getAiringTvSeries.execute();

    result.fold(
      (failure) {
        _message = failure.message;
        _state = RequestState.Error;
        notifyListeners();
      },
      (series) {
        _tvSeries = series;
        _state = RequestState.Loaded;
        notifyListeners();
      },
    );
  }
}
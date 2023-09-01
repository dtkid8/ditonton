import 'package:ditonton/data/models/tv_series_response.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../dummy_data/tv_series_dummy_objects.dart';

void main() {
  test('should be a subclass of TvSeries entity', () async {
    final result = TvSeriesResponse.fromJson(testTvSeriesListResponse).tvSeriesList.first.toEntity();
    expect(result, testTvSeries);
  });

  test('should be a TvSeries json response', () async {
    final result =  TvSeriesResponse.fromJson(testTvSeriesListResponse).tvSeriesList.first.toJson();
    expect(result, testTvSeriesResponse);
  });

  test('should be a subclass of TvSeries Response', () async {
    final result = TvSeriesResponse.fromJson(testTvSeriesListResponse);
    expect(result, testTvSeriesModel);
  });
}

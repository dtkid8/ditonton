import 'package:ditonton/data/models/tv_series_detail_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../dummy_data/tv_series_dummy_objects.dart';

void main() {
  test('should be a subclass of TvSeriesDetail entity', () async {
    final result = TvSeriesDetailModel.fromJson(testTvSeriesDetailResponse).toEntity();
    expect(result, testTvSeriesDetail);
  });

  test('should be a TvSeriesDetail json response', () async {
    final result = testTvSeriesDetailModel.toJson();
    expect(result, testTvSeriesDetailResponse);
  });

  test('should be a subclass of TvSeriesDetail Response', () async {
    final result = TvSeriesDetailModel.fromJson(testTvSeriesDetailResponse);
    expect(result, testTvSeriesDetailModel);
  });
}

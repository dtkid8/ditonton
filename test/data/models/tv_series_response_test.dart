import 'package:ditonton/data/models/tv_series_response.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../dummy_data/tv_series_dummy_objects.dart';

void main() {
  group('fromJson', () {
    test('should be a TvSeriesResponse json response', () async {
      final result = TvSeriesResponse.fromJson(testTvSeriesListResponse);
      expect(result, testTvSeriesModel);
    });
  });
  group('toJson', () {
    test('should return a JSON map containing proper data', () async {
      final result = testTvSeriesModel.toJson();

      expect(result, testTvSeriesModelMap);
    });
  });
}

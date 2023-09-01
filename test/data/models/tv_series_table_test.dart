import 'package:ditonton/data/models/tv_series_table.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../dummy_data/tv_series_dummy_objects.dart';

void main() {
  test('should be a subclass of TvSeriesTable from entity', () async {
    final result = TvSeriesTable.fromEntity(testTvSeriesDetail);
    expect(result, testTvSeriesTable);
  });

  test('should be a subclass of TvSeriesTable from map', () async {
    final result = TvSeriesTable.fromMap(testTvSeriesMap);
    expect(result, testTvSeriesTable);
  });

  test('should be a TvSeriesTable json response', () async {
    final result = testTvSeriesTable.toJson();
    expect(result, testTvSeriesMap);
  });

  test('should be a subclass of TvSeries', () async {
    final result = testTvSeriesTable.toEntity();
    expect(result, testTvSeriesTableToEntity);
  });
}

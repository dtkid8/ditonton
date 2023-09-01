import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/usecases/search_tv_series.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/tv_series_dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late SearchTvSeries useCase;
  late MockTvSeriesRepository mockTvSeriesRepository;

  setUp(() {
    mockTvSeriesRepository = MockTvSeriesRepository();
    useCase = SearchTvSeries(mockTvSeriesRepository);
  });

  test('should get list of series from the repository', () async {
    final query = "test";
    // arrange
    when(mockTvSeriesRepository.searchTvSeries(query)).thenAnswer((_) async => Right(testTvSeriesList));
    // act
    final result = await useCase.execute(query);
    // assert
    expect(result, Right(testTvSeriesList));
  });
}
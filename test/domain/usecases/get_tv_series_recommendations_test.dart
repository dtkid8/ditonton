import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/usecases/get_tv_series_recommendations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/tv_series_dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetTvSeriesRecommendations useCase;
  late MockTvSeriesRepository mockTvSeriesRepository;

  setUp(() {
    mockTvSeriesRepository = MockTvSeriesRepository();
    useCase = GetTvSeriesRecommendations(mockTvSeriesRepository);
  });

  test('should get list of series from the repository', () async {
    final id = 1399;
    // arrange
    when(mockTvSeriesRepository.getRecommendationTvSeries(id)).thenAnswer((_) async => Right(testTvSeriesList));
    // act
    final result = await useCase.execute(id);
    // assert
    expect(result, Right(testTvSeriesList));
  });
}
import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/usecases/get_top_rated_tv_series.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/tv_series_dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetTopRatedTvSeries useCase;
  late MockTvSeriesRepository mockTvSeriesRepository;

  setUp(() {
    mockTvSeriesRepository = MockTvSeriesRepository();
    useCase = GetTopRatedTvSeries(mockTvSeriesRepository);
  });

  test('should get list of series from the repository', () async {
    // arrange
    when(mockTvSeriesRepository.getTopRatedTvSeries()).thenAnswer((_) async => Right(testTvSeriesList));
    // act
    final result = await useCase.execute();
    // assert
    expect(result, Right(testTvSeriesList));
  });
}
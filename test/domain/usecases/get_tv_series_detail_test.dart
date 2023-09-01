import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/usecases/get_tv_series_detail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/tv_series_dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetTvSeriesDetail useCase;
  late MockTvSeriesRepository mockTvSeriesRepository;

  setUp(() {
    mockTvSeriesRepository = MockTvSeriesRepository();
    useCase = GetTvSeriesDetail(mockTvSeriesRepository);
  });

  test('should get detail series from the repository', () async {
    final id = 1399;
    // arrange
    when(mockTvSeriesRepository.getDetailTvSeries(id)).thenAnswer((_) async => Right(testTvSeriesDetail));
    // act
    final result = await useCase.execute(id);
    // assert
    expect(result, Right(testTvSeriesDetail));
  });
}
import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/usecases/save_watchlist_series.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../dummy_data/tv_series_dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late SaveWatchlistSeries usecase;
  late MockTvSeriesRepository mockTvSeriesRepository;

  setUp(() {
    mockTvSeriesRepository = MockTvSeriesRepository();
    usecase = SaveWatchlistSeries(mockTvSeriesRepository);
  });

  test('should save movie to the repository', () async {
    // arrange
    when(mockTvSeriesRepository.saveWatchlistSeries(testTvSeriesDetail))
        .thenAnswer((_) async => Right('Added to Watchlist'));
    // act
    final result = await usecase.execute(testTvSeriesDetail);
    // assert
    verify(mockTvSeriesRepository.saveWatchlistSeries(testTvSeriesDetail));
    expect(result, Right('Added to Watchlist'));
  });
}

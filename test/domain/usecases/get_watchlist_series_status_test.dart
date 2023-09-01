import 'package:ditonton/domain/usecases/get_watchlist_series_status.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetWatchListSeriesStatus usecase;
  late MockTvSeriesRepository mockTvSeriesRepository;

  setUp(() {
    mockTvSeriesRepository = MockTvSeriesRepository();
    usecase = GetWatchListSeriesStatus(mockTvSeriesRepository);
  });

  test('should get watchlist status from repository', () async {
    // arrange
    when(mockTvSeriesRepository.isAddedToWatchlistSeries(1339))
        .thenAnswer((_) async => true);
    // act
    final result = await usecase.execute(1339);
    // assert
    verify(mockTvSeriesRepository.isAddedToWatchlistSeries(1339));
    expect(result, true);
  });
}
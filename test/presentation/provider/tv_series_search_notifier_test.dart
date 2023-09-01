import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/usecases/search_tv_series.dart';
import 'package:ditonton/presentation/provider/tv_series_search_notifier.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import '../../dummy_data/tv_series_dummy_objects.dart';
import 'tv_series_search_notifier_test.mocks.dart';

@GenerateMocks([SearchTvSeries])
void main() {
  late MockSearchTvSeries mockSearchTvSeries;
  late TvSeriesSearchNotifier provider;
  late int listenerCallCount;
  final query = "test";

  setUp(() {
    listenerCallCount = 0;
    mockSearchTvSeries = MockSearchTvSeries();
    provider = TvSeriesSearchNotifier(searchTvSeries: mockSearchTvSeries)
      ..addListener(() {
        listenerCallCount+=1;
      });
  });

  test('should change state to loading when usecase is called', () async {
    // arrange
    when(mockSearchTvSeries.execute(query)).thenAnswer((_) async => Right(testTvSeriesList));
    // act
    provider.fetchTvSeriesSearch(query);
    // assert
    expect(provider.state, RequestState.Loading);
    expect(listenerCallCount, 1);
  });

  test('should change movies data when data is gotten successfully', () async {
    // arrange
    when(mockSearchTvSeries.execute(query)).thenAnswer((_) async => Right(testTvSeriesList));
    // act
     await provider.fetchTvSeriesSearch(query);
    // assert
    expect(provider.state, RequestState.Loaded);
    expect(provider.searchResult, testTvSeriesList);
    expect(listenerCallCount, 2);
  });

  test('should return error when data is unsuccessful', () async {
    // arrange
    when(mockSearchTvSeries.execute(query)).thenAnswer((_) async => Left(ServerFailure('Server Failure')));
    // act
    await provider.fetchTvSeriesSearch(query);
    // assert
    expect(provider.state, RequestState.Error);
    expect(provider.message, 'Server Failure');
    expect(listenerCallCount, 2);
  });
}

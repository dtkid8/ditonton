import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:ditonton/common/exception.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/data/repositories/tv_series_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/tv_series_dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late TvSeriesRepositoryImpl repository;
  late MockTvSeriesRemoteDataSource mockRemoteDataSource;
  late MockTvSeriesLocalDataSource mockLocalDataSource;
  setUp(() {
    mockRemoteDataSource = MockTvSeriesRemoteDataSource();
    mockLocalDataSource = MockTvSeriesLocalDataSource();
    repository = TvSeriesRepositoryImpl(
      localDataSource: mockLocalDataSource,
      remoteDataSource: mockRemoteDataSource,
    );
  });

  group('Now Playing Series', () {
    test('should return remote data when the call to remote data source is successful', () async {
      // arrange
      when(mockRemoteDataSource.getNowPlayingTvSeries()).thenAnswer((_) async => testTvSeriesListModel);
      // act
      final result = await repository.getNowPlayingTvSeries();
      // assert
      verify(mockRemoteDataSource.getNowPlayingTvSeries());
      /* workaround to test List in Right. Issue: https://github.com/spebbe/dartz/issues/80 */
      final resultList = result.getOrElse(() => []);
      expect(resultList, testTvSeriesList);
    });

    test('should return server failure when the call to remote data source is unsuccessful', () async {
      // arrange
      when(mockRemoteDataSource.getNowPlayingTvSeries()).thenThrow(ServerException());
      // act
      final result = await repository.getNowPlayingTvSeries();
      // assert
      verify(mockRemoteDataSource.getNowPlayingTvSeries());
      expect(result, equals(Left(ServerFailure(''))));
    });

    test('should return connection failure when the device is not connected to internet', () async {
      // arrange
      when(mockRemoteDataSource.getNowPlayingTvSeries()).thenThrow(SocketException('Failed to connect to the network'));
      // act
      final result = await repository.getNowPlayingTvSeries();
      // assert
      verify(mockRemoteDataSource.getNowPlayingTvSeries());
      expect(result, equals(Left(ConnectionFailure('Failed to connect to the network'))));
    });
  });

  group('Popular Series', () {
    test('should return remote data when the call to remote data source is successful', () async {
      // arrange
      when(mockRemoteDataSource.getPopularTvSeries()).thenAnswer((_) async => testTvSeriesListModel);
      // act
      final result = await repository.getPopularTvSeries();
      // assert
      verify(mockRemoteDataSource.getPopularTvSeries());
      /* workaround to test List in Right. Issue: https://github.com/spebbe/dartz/issues/80 */
      final resultList = result.getOrElse(() => []);
      expect(resultList, testTvSeriesList);
    });

    test('should return server failure when the call to remote data source is unsuccessful', () async {
      // arrange
      when(mockRemoteDataSource.getPopularTvSeries()).thenThrow(ServerException());
      // act
      final result = await repository.getPopularTvSeries();
      // assert
      verify(mockRemoteDataSource.getPopularTvSeries());
      expect(result, equals(Left(ServerFailure(''))));
    });

    test('should return connection failure when the device is not connected to internet', () async {
      // arrange
      when(mockRemoteDataSource.getPopularTvSeries()).thenThrow(SocketException('Failed to connect to the network'));
      // act
      final result = await repository.getPopularTvSeries();
      // assert
      verify(mockRemoteDataSource.getPopularTvSeries());
      expect(result, equals(Left(ConnectionFailure('Failed to connect to the network'))));
    });
  });

  group('Top Rated Series', () {
    test('should return remote data when the call to remote data source is successful', () async {
      // arrange
      when(mockRemoteDataSource.getTopRatedTvSeries()).thenAnswer((_) async => testTvSeriesListModel);
      // act
      final result = await repository.getTopRatedTvSeries();
      // assert
      verify(mockRemoteDataSource.getTopRatedTvSeries());
      /* workaround to test List in Right. Issue: https://github.com/spebbe/dartz/issues/80 */
      final resultList = result.getOrElse(() => []);
      expect(resultList, testTvSeriesList);
    });

    test('should return server failure when the call to remote data source is unsuccessful', () async {
      // arrange
      when(mockRemoteDataSource.getTopRatedTvSeries()).thenThrow(ServerException());
      // act
      final result = await repository.getTopRatedTvSeries();
      // assert
      verify(mockRemoteDataSource.getTopRatedTvSeries());
      expect(result, equals(Left(ServerFailure(''))));
    });

    test('should return connection failure when the device is not connected to internet', () async {
      // arrange
      when(mockRemoteDataSource.getTopRatedTvSeries()).thenThrow(SocketException('Failed to connect to the network'));
      // act
      final result = await repository.getTopRatedTvSeries();
      // assert
      verify(mockRemoteDataSource.getTopRatedTvSeries());
      expect(result, equals(Left(ConnectionFailure('Failed to connect to the network'))));
    });
  });

  group('Get Series Detail', () {
    final id = 1399;
    test('should return remote data when the call to remote data source is successful', () async {
      // arrange
      when(mockRemoteDataSource.getDetailTvSeries(id)).thenAnswer((_) async => testTvSeriesDetailModel);
      // act
      final result = await repository.getDetailTvSeries(id);
      // assert
      verify(mockRemoteDataSource.getDetailTvSeries(id));
      expect(result, equals(Right(testTvSeriesDetail)));
    });

    test('should return server failure when the call to remote data source is unsuccessful', () async {
      // arrange
      when(mockRemoteDataSource.getDetailTvSeries(id)).thenThrow(ServerException());
      // act
      final result = await repository.getDetailTvSeries(id);

      // assert
      verify(mockRemoteDataSource.getDetailTvSeries(id));
      expect(result, equals(Left(ServerFailure(''))));
    });

    test('should return connection failure when the device is not connected to internet', () async {
      // arrange
      when(mockRemoteDataSource.getDetailTvSeries(id)).thenThrow(SocketException('Failed to connect to the network'));
      // act
      final result = await repository.getDetailTvSeries(id);
      // assert
      verify(mockRemoteDataSource.getDetailTvSeries(id));
      expect(result, equals(Left(ConnectionFailure('Failed to connect to the network'))));
    });
  });

  group('Get Series Recommendation', () {
    final id = 1399;
    test('should return remote data when the call to remote data source is successful', () async {
      // arrange
      when(mockRemoteDataSource.getRecommendationTvSeries(id)).thenAnswer((_) async => testTvSeriesListModel);
      // act
      final result = await repository.getRecommendationTvSeries(id);
      // assert
      verify(mockRemoteDataSource.getRecommendationTvSeries(id));
      final resultList = result.getOrElse(() => []);
      expect(resultList, testTvSeriesList);
    });

    test('should return server failure when the call to remote data source is unsuccessful', () async {
      // arrange
      when(mockRemoteDataSource.getRecommendationTvSeries(id)).thenThrow(ServerException());
      // act
      final result = await repository.getRecommendationTvSeries(id);

      // assert
      verify(mockRemoteDataSource.getRecommendationTvSeries(id));
      expect(result, equals(Left(ServerFailure(''))));
    });

    test('should return connection failure when the device is not connected to internet', () async {
      // arrange
      when(mockRemoteDataSource.getRecommendationTvSeries(id)).thenThrow(SocketException('Failed to connect to the network'));
      // act
      final result = await repository.getRecommendationTvSeries(id);
      // assert
      verify(mockRemoteDataSource.getRecommendationTvSeries(id));
      expect(result, equals(Left(ConnectionFailure('Failed to connect to the network'))));
    });
  });

  group('Search Series', () {
    final query = "test";
    test('should return remote data when the call to remote data source is successful', () async {
      // arrange
      when(mockRemoteDataSource.searchTvSeries(query)).thenAnswer((_) async => testTvSeriesListModel);
      // act
      final result = await repository.searchTvSeries(query);
      // assert
      verify(mockRemoteDataSource.searchTvSeries(query));
      final resultList = result.getOrElse(() => []);
      expect(resultList, testTvSeriesList);
    });

    test('should return server failure when the call to remote data source is unsuccessful', () async {
      // arrange
      when(mockRemoteDataSource.searchTvSeries(query)).thenThrow(ServerException());
      // act
      final result = await repository.searchTvSeries(query);

      // assert
      verify(mockRemoteDataSource.searchTvSeries(query));
      expect(result, equals(Left(ServerFailure(''))));
    });

    test('should return connection failure when the device is not connected to internet', () async {
      // arrange
      when(mockRemoteDataSource.searchTvSeries(query)).thenThrow(SocketException('Failed to connect to the network'));
      // act
      final result = await repository.searchTvSeries(query);
      // assert
      verify(mockRemoteDataSource.searchTvSeries(query));
      expect(result, equals(Left(ConnectionFailure('Failed to connect to the network'))));
    });
  });

  group('Save watchlist series', () {
    test('should return success message when saving successful', () async {
      // arrange
      when(mockLocalDataSource.insertWatchlistSeries(testTvSeriesTable)).thenAnswer((_) async => 'Added to Watchlist');
      // act
      final result = await repository.saveWatchlistSeries(testTvSeriesDetail);
      // assert
      expect(result, Right('Added to Watchlist'));
    });

    test('should return DatabaseFailure when saving unsuccessful', () async {
      // arrange
      when(mockLocalDataSource.insertWatchlistSeries(testTvSeriesTable)).thenThrow(DatabaseException('Failed to add watchlist'));
      // act
      final result = await repository.saveWatchlistSeries(testTvSeriesDetail);
      // assert
      expect(result, Left(DatabaseFailure('Failed to add watchlist')));
    });
  });

  group('Remove watchlist series', () {
    test('should return success message when remove successful', () async {
      // arrange
      when(mockLocalDataSource.removeWatchlistSeries(testTvSeriesTable)).thenAnswer((_) async => 'Removed from watchlist');
      // act
      final result = await repository.removeWatchlistSeries(testTvSeriesDetail);
      // assert
      expect(result, Right('Removed from watchlist'));
    });

    test('should return DatabaseFailure when remove unsuccessful', () async {
      // arrange
      when(mockLocalDataSource.removeWatchlistSeries(testTvSeriesTable)).thenThrow(DatabaseException('Failed to remove watchlist'));
      // act
      final result = await repository.removeWatchlistSeries(testTvSeriesDetail);
      // assert
      expect(result, Left(DatabaseFailure('Failed to remove watchlist')));
    });
  });

  group('get watchlist series status', () {
    test('should return watch status whether data is found', () async {
      // arrange
      final tId = 1399;
      when(mockLocalDataSource.getTvSeriesById(tId)).thenAnswer((_) async => null);
      // act
      final result = await repository.isAddedToWatchlistSeries(tId);
      // assert
      expect(result, false);
    });
  });

  group('get watchlist series', () {
    test('should return list of series', () async {
      // arrange
      when(mockLocalDataSource.getWatchlistTvSeries()).thenAnswer((_) async => [testTvSeriesTable]);
      // act
      final result = await repository.getWatchlistSeries();
      // assert
      final resultList = result.getOrElse(() => []);
      expect(resultList, [testTvSeriesTableToEntity]);
    });

    test('should return DatabaseFailure when remove unsuccessful', () async {
      // arrange
      when(mockLocalDataSource.getWatchlistTvSeries()).thenThrow(DatabaseException(""));
      // act
      final result = await repository.getWatchlistSeries();
      // assert
      expect(result, Left(DatabaseFailure("")));
    });
  });
}

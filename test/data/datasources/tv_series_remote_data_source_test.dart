import 'dart:convert';
import 'dart:io';

import 'package:ditonton/common/exception.dart';
import 'package:ditonton/data/datasources/tv_series_remote_data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import '../../dummy_data/tv_series_dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  const API_KEY = 'api_key=2174d146bb9c0eab47529b2e77d6b526';
  const BASE_URL = 'https://api.themoviedb.org/3';

  late TvSeriesRemoteDataSourceImpl dataSource;
  late MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = TvSeriesRemoteDataSourceImpl(client: mockHttpClient);
  });

  group('get Now Playing Movies', () {
    test('should return list of Tv Series Model when the response code is 200', () async {
      // arrange
      when(mockHttpClient.get(Uri.parse('$BASE_URL/tv/airing_today?$API_KEY'))).thenAnswer(
        (_) async => http.Response(jsonEncode(testTvSeriesListResponse), 200, headers: {
          HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
        }),
      );
      // act
      final result = await dataSource.getNowPlayingTvSeries();
      // assert
      expect(result, equals(testTvSeriesListModel));
    });

    test('should throw a ServerException when the response code is 404 or other', () async {
      // arrange
      when(mockHttpClient.get(Uri.parse('$BASE_URL/tv/airing_today?$API_KEY'))).thenAnswer((_) async => http.Response('Not Found', 404));
      // act
      final call = dataSource.getNowPlayingTvSeries();
      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });

  group('get Popular Tv Series', () {
    test('should return list of series when response is success (200)', () async {
      // arrange
      when(mockHttpClient.get(Uri.parse('$BASE_URL/tv/popular?$API_KEY'))).thenAnswer(
        (_) async => http.Response(jsonEncode(testTvSeriesListResponse), 200, headers: {
          HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
        }),
      );
      // act
      final result = await dataSource.getPopularTvSeries();
      // assert
      expect(result, testTvSeriesListModel);
    });

    test('should throw a ServerException when the response code is 404 or other', () async {
      // arrange
      when(mockHttpClient.get(Uri.parse('$BASE_URL/tv/popular?$API_KEY'))).thenAnswer((_) async => http.Response('Not Found', 404));
      // act
      final call = dataSource.getPopularTvSeries();
      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });

  group('get Top Rated Tv Series', () {
    test('should return list of series when response is success (200)', () async {
      // arrange
      when(mockHttpClient.get(Uri.parse('$BASE_URL/tv/top_rated?$API_KEY'))).thenAnswer(
        (_) async => http.Response(jsonEncode(testTvSeriesListResponse), 200, headers: {
          HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
        }),
      );
      // act
      final result = await dataSource.getTopRatedTvSeries();
      // assert
      expect(result, testTvSeriesListModel);
    });

    test('should throw a ServerException when the response code is 404 or other', () async {
      // arrange
      when(mockHttpClient.get(Uri.parse('$BASE_URL/tv/top_rated?$API_KEY'))).thenAnswer((_) async => http.Response('Not Found', 404));
      // act
      final call = dataSource.getTopRatedTvSeries();
      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });

  group('get Tv Series Detail', () {
    final id = 1399;
    test('should return series detail when response is success (200)', () async {
      // arrange

      when(mockHttpClient.get(Uri.parse('$BASE_URL/tv/$id?$API_KEY'))).thenAnswer(
        (_) async => http.Response(jsonEncode(testTvSeriesDetailResponse), 200, headers: {
          HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
        }),
      );
      // act
      final result = await dataSource.getDetailTvSeries(id);
      // assert
      expect(result, testTvSeriesDetailModel);
    });

    test('should throw a ServerException when the response code is 404 or other', () async {
      // arrange
      when(mockHttpClient.get(Uri.parse('$BASE_URL/tv/1399?$API_KEY'))).thenAnswer((_) async => http.Response('Not Found', 404));
      // act
      final call = dataSource.getDetailTvSeries(id);
      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });

  group('get Tv Series Recommendations', () {
    final id = 1399;
    test('should return list of series recommendation when response is success (200)', () async {
      // arrange
      when(mockHttpClient.get(Uri.parse('$BASE_URL/tv/$id/recommendations?$API_KEY'))).thenAnswer(
        (_) async => http.Response(jsonEncode(testTvSeriesListResponse), 200, headers: {
          HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
        }),
      );
      // act
      final result = await dataSource.getRecommendationTvSeries(id);
      // assert
      expect(result, testTvSeriesListModel);
    });

    test('should throw a ServerException when the response code is 404 or other', () async {
      // arrange
      when(mockHttpClient.get(Uri.parse('$BASE_URL/tv/$id/recommendations?$API_KEY'))).thenAnswer((_) async => http.Response('Not Found', 404));
      // act
      final call = dataSource.getRecommendationTvSeries(id);
      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });

  group('search Tv Series Recommendations', () {
    final query = "test";
    test('should return list of series search when response is success (200)', () async {
      // arrange
      when(mockHttpClient.get(Uri.parse('$BASE_URL/search/tv?$API_KEY&query=$query'))).thenAnswer(
        (_) async => http.Response(jsonEncode(testTvSeriesListResponse), 200, headers: {
          HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
        }),
      );
      // act
      final result = await dataSource.searchTvSeries(query);
      // assert
      expect(result, testTvSeriesListModel);
    });

    test('should throw a ServerException when the response code is 404 or other', () async {
      // arrange
      when(mockHttpClient.get(Uri.parse('$BASE_URL/search/tv?$API_KEY&query=$query'))).thenAnswer((_) async => http.Response('Not Found', 404));
      // act
      final call = dataSource.searchTvSeries(query);
      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });
}

import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/presentation/pages/tv_series_airing_page.dart';
import 'package:ditonton/presentation/provider/airing_tv_series_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

import '../../dummy_data/tv_series_dummy_objects.dart';
import 'tv_series_airing_page_test.mocks.dart';

@GenerateMocks([AiringTvSeriesNotifier])
void main() {
  late MockAiringTvSeriesNotifier mockNotifier;

  setUp(() {
    mockNotifier = MockAiringTvSeriesNotifier();
  });

  // Widget _makeTestableWidget(Widget body) {
  //   return ChangeNotifierProvider<AiringTvSeriesNotifier>.value(
  //     value: mockNotifier,
  //     child: MaterialApp(
  //       home: body,
  //     ),
  //   );
  // }

  // testWidgets('Page should display center progress bar when loading',
  //     (WidgetTester tester) async {
  //   when(mockNotifier.state).thenReturn(RequestState.Loading);

  //   final progressBarFinder = find.byType(CircularProgressIndicator);
  //   final centerFinder = find.byType(Center);

  //   await tester.pumpWidget(_makeTestableWidget(TvSeriesAiringPage()));

  //   expect(centerFinder, findsOneWidget);
  //   expect(progressBarFinder, findsOneWidget);
  // });

  // testWidgets('Page should display ListView when data is loaded',
  //     (WidgetTester tester) async {
  //   when(mockNotifier.state).thenReturn(RequestState.Loaded);
  //   when(mockNotifier.tvSeries).thenReturn(testTvSeriesList);

  //   final listViewFinder = find.byType(ListView);

  //   await tester.pumpWidget(_makeTestableWidget(TvSeriesAiringPage()));

  //   expect(listViewFinder, findsOneWidget);
  // });

  // testWidgets('Page should display text with message when Error',
  //     (WidgetTester tester) async {
  //   when(mockNotifier.state).thenReturn(RequestState.Error);
  //   when(mockNotifier.message).thenReturn('Error message');

  //   final textFinder = find.byKey(Key('error_message'));

  //   await tester.pumpWidget(_makeTestableWidget(TvSeriesAiringPage()));

  //   expect(textFinder, findsOneWidget);
  // });
}
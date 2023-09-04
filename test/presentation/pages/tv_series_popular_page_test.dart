import 'package:bloc_test/bloc_test.dart';
import 'package:ditonton/presentation/bloc/general_state.dart';
import 'package:ditonton/presentation/bloc/popular_tv_series_cubit.dart';
import 'package:ditonton/presentation/pages/tv_series_popular_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../dummy_data/tv_series_dummy_objects.dart';

class MockPopularTvSeriesCubit extends MockCubit<GeneralState> implements PopularTvSeriesCubit {}

void main() {
  late PopularTvSeriesCubit mockCubit;

  setUp(() {
    mockCubit = MockPopularTvSeriesCubit();
  });

  Widget _makeTestableWidget(Widget body) {
    return BlocProvider.value(
      value: mockCubit,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets('Page should display center progress bar when loading', (WidgetTester tester) async {
    when(() => mockCubit.fetchPopularTvSeries()).thenAnswer((_) async {});
    when(() => mockCubit.state).thenReturn(GeneralLoadingState());

    final progressBarFinder = find.byType(CircularProgressIndicator);
    final centerFinder = find.byType(Center);

    await tester.pumpWidget(_makeTestableWidget(TvSeriesPopularPage()));

    expect(centerFinder, findsOneWidget);
    expect(progressBarFinder, findsOneWidget);
  });

  testWidgets('Page should display ListView when data is loaded', (WidgetTester tester) async {
    when(() => mockCubit.fetchPopularTvSeries()).thenAnswer((_) async {});
    when(() => mockCubit.state).thenReturn(GeneralLoadedState(testTvSeriesList));

    final listViewFinder = find.byType(ListView);

    await tester.pumpWidget(_makeTestableWidget(TvSeriesPopularPage()));

    expect(listViewFinder, findsOneWidget);
  });

  testWidgets('Page should display text with message when Error', (WidgetTester tester) async {
    when(() => mockCubit.fetchPopularTvSeries()).thenAnswer((_) async {});
    when(() => mockCubit.state).thenReturn(GeneralErrorState("Error message"));
    final textFinder = find.byKey(Key('error_message'));

    await tester.pumpWidget(_makeTestableWidget(TvSeriesPopularPage()));

    expect(textFinder, findsOneWidget);
  });
}

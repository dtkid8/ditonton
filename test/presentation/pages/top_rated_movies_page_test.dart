import 'package:bloc_test/bloc_test.dart';
import 'package:ditonton/presentation/bloc/general_state.dart';
import 'package:ditonton/presentation/bloc/top_rated_movies_cubit.dart';
import 'package:ditonton/presentation/pages/top_rated_movies_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../dummy_data/dummy_objects.dart';

class MockTopRatedMoviesCubit extends MockCubit<GeneralState> implements TopRatedMoviesCubit {}

void main() {
  late TopRatedMoviesCubit mockCubit;

  setUp(() {
    mockCubit = MockTopRatedMoviesCubit();
  });

  Widget _makeTestableWidget(Widget body) {
    return BlocProvider.value(
      value: mockCubit,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets('Page should display progress bar when loading', (WidgetTester tester) async {
    when(() => mockCubit.fetchTopRatedMovies()).thenAnswer((_) async {});
    when(() => mockCubit.state).thenReturn(GeneralLoadingState());

    final progressFinder = find.byType(CircularProgressIndicator);
    final centerFinder = find.byType(Center);

    await tester.pumpWidget(_makeTestableWidget(TopRatedMoviesPage()));

    expect(centerFinder, findsOneWidget);
    expect(progressFinder, findsOneWidget);
  });

  testWidgets('Page should display when data is loaded', (WidgetTester tester) async {
    when(() => mockCubit.fetchTopRatedMovies()).thenAnswer((_) async {});
    when(() => mockCubit.state).thenReturn(GeneralLoadedState(testMovieList));

    final listViewFinder = find.byType(ListView);

    await tester.pumpWidget(_makeTestableWidget(TopRatedMoviesPage()));

    expect(listViewFinder, findsOneWidget);
  });

  testWidgets('Page should display text with message when Error', (WidgetTester tester) async {
    when(() => mockCubit.fetchTopRatedMovies()).thenAnswer((_) async {});
    when(() => mockCubit.state).thenReturn(GeneralErrorState("Error message"));

    final textFinder = find.byKey(Key('error_message'));

    await tester.pumpWidget(_makeTestableWidget(TopRatedMoviesPage()));

    expect(textFinder, findsOneWidget);
  });
}

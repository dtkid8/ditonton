import 'package:bloc_test/bloc_test.dart';
import 'package:ditonton/presentation/bloc/general_state.dart';
import 'package:ditonton/presentation/bloc/popular_movies_cubit.dart';
import 'package:ditonton/presentation/pages/popular_movies_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../dummy_data/dummy_objects.dart';

class MockPopularMoviesCubit extends MockCubit<GeneralState> implements PopularMoviesCubit {}

void main() {
  late PopularMoviesCubit mockCubit;
  setUp(() {
    mockCubit = MockPopularMoviesCubit();
  });

  Widget _makeTestableWidget(Widget body) {
    return BlocProvider<PopularMoviesCubit>.value(
      value: mockCubit,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets('Page should display center progress bar when loading', (WidgetTester tester) async {
    when(() => mockCubit.fetchPopularMovies()).thenAnswer((_) async {});
    when(() => mockCubit.state).thenReturn(GeneralLoadingState());

    final progressBarFinder = find.byType(CircularProgressIndicator);
    final centerFinder = find.byType(Center);

    await tester.pumpWidget(_makeTestableWidget(PopularMoviesPage()));

    expect(centerFinder, findsOneWidget);
    expect(progressBarFinder, findsOneWidget);
  });

  testWidgets('Page should display ListView when data is loaded', (WidgetTester tester) async {
    when(() => mockCubit.fetchPopularMovies()).thenAnswer((_) async {});
    when(() => mockCubit.state).thenReturn(GeneralLoadedState(testMovieList));

    final listViewFinder = find.byType(ListView);

    await tester.pumpWidget(_makeTestableWidget(PopularMoviesPage()));

    expect(listViewFinder, findsOneWidget);
  });

  testWidgets('Page should display text with message when Error', (WidgetTester tester) async {
    when(() => mockCubit.fetchPopularMovies()).thenAnswer((_) async {});
    when(() => mockCubit.state).thenReturn(GeneralErrorState("Error message"));

    final textFinder = find.byKey(Key('error_message'));

    await tester.pumpWidget(_makeTestableWidget(PopularMoviesPage()));

    expect(textFinder, findsOneWidget);
  });
}

import 'package:ditonton/presentation/widgets/tv_series_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../dummy_data/tv_series_dummy_objects.dart';

void main() {
  testWidgets('TvSeriesCard has a card', (tester) async {
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: TvSeriesCard(testTvSeries))));
    final cardFinder = find.byType(Card);
    expect(cardFinder, findsNWidgets(1));
  });
}

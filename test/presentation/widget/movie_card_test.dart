import 'package:ditonton/presentation/widgets/movie_card_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../dummy_data/dummy_objects.dart';

void main() {
  testWidgets('MovieCard has a card', (tester) async {
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: MovieCard(testMovie))));
    final cardFinder = find.byType(Card);
    expect(cardFinder, findsNWidgets(1));
  });
}

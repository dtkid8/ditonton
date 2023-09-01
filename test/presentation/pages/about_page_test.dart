import 'package:ditonton/presentation/pages/about_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget _makeTestableWidget(Widget body) {
    return MaterialApp(
      home: body,
    );
  }

  testWidgets('Page should display Image when data is loaded', (WidgetTester tester) async {
    final imageFinder = find.byType(Image);

    await tester.pumpWidget(_makeTestableWidget(AboutPage()));

    expect(imageFinder, findsOneWidget);
  });
}

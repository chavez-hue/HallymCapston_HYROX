import 'package:flutter_test/flutter_test.dart';
import 'package:hyrox_app/app.dart';

void main() {
  testWidgets('RRP app loads splash screen', (WidgetTester tester) async {
    await tester.pumpWidget(const RRPApp());

    expect(find.text('RRP'), findsOneWidget);
    expect(find.text('Running Route Puzzle'), findsOneWidget);
  });
}
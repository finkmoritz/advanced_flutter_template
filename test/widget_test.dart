import 'package:advanced_flutter_template/app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const App());

    expect(find.text('Hello World!'), findsOneWidget);
  });
}

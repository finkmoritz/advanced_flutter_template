import 'package:advanced_flutter_template/app.dart';
import 'package:flutter_test/flutter_test.dart';

import 'mocks/providers/basic_providers_mock.dart';

void main() {
  testWidgets('Smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const BasicProvidersMock(
      child: App(),
    ));

    expect(find.text('Quick Start'), findsOneWidget);
  });
}

import 'package:flutter_test/flutter_test.dart';

import 'loginpage_test.dart';
import 'onboarding_test.dart';
import 'registerpage_test.dart';

void main() {
  testWidgets('Test Boarding Page', (WidgetTester tester) async {
    await testOnBoarding(tester);
  });
  testWidgets('Test Login Page', (WidgetTester tester) async {
    await testLoginPage(tester);
  });
  testWidgets('Test Register Page', (WidgetTester tester) async {
    await testRegisterPage(tester);
  });
}
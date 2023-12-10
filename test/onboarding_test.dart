import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:smartspend/backend/user.dart';
import 'package:smartspend/pages/onboardingpage.dart';

Future<void> testOnBoarding(WidgetTester tester) async {
  User client = User(
      userID: 0,
      name: "joe",
      passcode: "",
      birthDate: "",
      newUser: 0,
      monthlyIncome: 30000
  );
  // Build our app and trigger a frame.
  await tester.pumpWidget(
    MaterialApp(home: BoardingPage(client: client)),
  );
  expect(((tester.firstWidget(find.byType(Container)) as Container).decoration
  as BoxDecoration).gradient,
      const LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          Color(0xFF1E2038),
          Color.fromARGB(255, 26, 26, 42),
        ],));

  expect(find.text('Smart'), findsOneWidget);
  expect(find.text('Spend'), findsOneWidget);
  expect(find.text('Spend Smart, Spend Wise'), findsOneWidget);
  expect(find.image(const AssetImage('assets/logo.png')), findsOneWidget);

  expect(find.byType(TextButton), findsOneWidget);
  await tester.tap(find.byType(TextButton));
}
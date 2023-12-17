import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:smartspend/backend/user.dart';
import 'package:smartspend/pages/setcodepage.dart';
import 'package:smartspend/widgets/numpad.dart';


void main() {
  testWidgets('Test SetCodePage', (WidgetTester tester) async {
    Future<void> testSetCodePage(WidgetTester tester) async {
      User client = User(
          userID: 0,
          name: "joe",
          passcode: "",
          birthDate: "11/11/2024",
          newUser: 0,
          monthlyIncome: 30000
      );

      await tester.pumpWidget(
        MaterialApp(
          home: SetCodePage(client: client))
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

      expect(find.widgetWithText(TextButton, "BACK"), findsOneWidget);
      expect(find.text("Choose a passcode"), findsOneWidget);
      expect(find.byType(NumpadWidget), findsOneWidget);

      await tester.tap(find.widgetWithText(TextButton, "1"));
      await tester.tap(find.widgetWithText(TextButton, "1"));
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.circle), findsNWidgets(2));

      await tester.tap(find.widgetWithText(TextButton, "1"));
      await tester.tap(find.widgetWithText(TextButton, "1"));
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.circle), findsNWidgets(4));

      //I think the tester has the keyboard showing, and we need to scroll until
      //the button becomes visable... weird bug but yeah only way to deal with it really
      await tester.scrollUntilVisible(find.widgetWithText(TextButton, "ENT"), 0);
      await tester.pumpAndSettle();

      await tester.tap(find.widgetWithText(TextButton, "ENT"));
      await tester.pumpAndSettle();

      expect(find.text("Re-enter your passcode"), findsOneWidget);

      await tester.scrollUntilVisible(find.widgetWithText(TextButton, "1"), 0);
      await tester.pumpAndSettle();

      await tester.tap(find.widgetWithText(TextButton, "1"));
      await tester.tap(find.widgetWithText(TextButton, "2"));
      await tester.tap(find.widgetWithText(TextButton, "2"));
      await tester.tap(find.widgetWithText(TextButton, "1"));

      await tester.scrollUntilVisible(find.widgetWithText(TextButton, "ENT"), 0);
      await tester.pumpAndSettle();

      await tester.tap(find.widgetWithText(TextButton, "ENT"));
      await tester.pumpAndSettle();

      expect(find.text("Did not match! Try again"), findsOneWidget);

      await tester.scrollUntilVisible(find.widgetWithText(TextButton, "1"), 0);
      await tester.pumpAndSettle();
      await tester.tap(find.widgetWithText(TextButton, "1"));
      await tester.tap(find.widgetWithText(TextButton, "2"));
      await tester.tap(find.widgetWithText(TextButton, "2"));
      await tester.tap(find.widgetWithText(TextButton, "1"));

      await tester.scrollUntilVisible(find.widgetWithText(TextButton, "ENT"), 0);
      await tester.pumpAndSettle();
      await tester.tap(find.widgetWithText(TextButton, "ENT"));
      await tester.pumpAndSettle();

      await tester.scrollUntilVisible(find.widgetWithText(TextButton, "1"), 0);
      await tester.pumpAndSettle();
      await tester.tap(find.widgetWithText(TextButton, "1"));
      await tester.tap(find.widgetWithText(TextButton, "2"));
      await tester.tap(find.widgetWithText(TextButton, "2"));
      await tester.tap(find.widgetWithText(TextButton, "1"));

      await tester.scrollUntilVisible(find.widgetWithText(TextButton, "ENT"), 0);
      await tester.pumpAndSettle();
    }
    testSetCodePage(tester);
  });
}
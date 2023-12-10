import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:smartspend/backend/user.dart';
import 'package:smartspend/pages/registerpage.dart';

void main() {
  testWidgets('Test Boarding Page', (WidgetTester tester) async {
    Future<void> testRegisterPage(WidgetTester tester) async {
      //pre req data
      User client = User(
          userID: 0,
          name: "joe",
          passcode: "",
          birthDate: "",
          newUser: 0,
          monthlyIncome: 30000
      );

      //load page
      await tester.pumpWidget(MaterialApp(home: RegisterPage(client: client)));

      //verify all widgets loaded
      expect(find.text("REGISTER"), findsOneWidget);
      expect(find.widgetWithText(TextField, "Nickname"), findsOneWidget);
      expect(find.widgetWithText(TextField, "Birth-date"), findsOneWidget);
      expect(find.byIcon(Icons.circle_outlined), findsOneWidget);
      expect(find.text("I agree to the"), findsOneWidget);
      expect(find.widgetWithText(TextButton, "terms and conditions"),
          findsOneWidget);
      expect(find.widgetWithText(TextButton, "NEXT"), findsOneWidget);
      expect(find.widgetWithText(TextButton, "Cancel"), findsOneWidget);

      //verify nickname textfield works
      await tester.enterText(
          find.widgetWithText(TextField, "Nickname"), "TestUser");
      await tester.pumpAndSettle();

      expect(find.text("TestUser"), findsOne);

      //verify birth date text field works
      await tester.tap(find.widgetWithText(TextField, "Birth-date"));
      await tester.pumpAndSettle();

      expect(find.byType(DatePickerDialog), findsOneWidget);

      await tester.tap(find.text("OK"));
      await tester.pumpAndSettle();

      String date = "${DateTime
          .now()
          .day}/${DateTime
          .now()
          .month}/${DateTime
          .now()
          .year}";
      expect(find.text(date), findsOne);

      //verify that user can agree to tos works.
      await tester.tap(find.byIcon(Icons.circle_outlined));
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.check_circle), findsOneWidget);

      //verify that user can view tos.
      await tester.tap(find.widgetWithText(TextButton, "terms and conditions"));
      await tester.pumpAndSettle();

      expect(find.textContaining("YOUR AGREEMENT"), findsOne);

      await tester.tap(find.textContaining("YOUR AGREEMENT"));
      await tester.pumpAndSettle();

      expect(find.textContaining("YOUR AGREEMENT"), findsNothing);

      await tester.tap(find.widgetWithText(TextButton, "Cancel"));
      await tester.pumpAndSettle();
    }
    testRegisterPage(tester);
  });
}
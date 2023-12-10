import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:smartspend/backend/user.dart';
import 'package:smartspend/pages/loginpage.dart';


Future<void> testLoginPage(WidgetTester tester) async {

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
  await tester.pumpWidget(MaterialApp(home: LoginPage(client: client)));

  //check for the widgets that should be here
  expect(find.text("LOGIN"), findsOneWidget);
  expect(find.byType(TextButton), findsNWidgets(2)); 
  expect(find.text("Link to Bank Account"), findsOneWidget);
  expect(find.text("SIGN UP MANUALLY"), findsOneWidget);

  //make sure buttons work
  await tester.ensureVisible(find.widgetWithText(TextButton, "Link to Bank Account"));
  await tester.pumpAndSettle();
  await tester.tap(find.widgetWithText(TextButton, "Link to Bank Account"));
  await tester.pumpAndSettle();

  //check that new widget is visiable
  expect(find.text("We are sorry."), findsOneWidget);
  expect(find.byIcon(Icons.cancel_sharp), findsOneWidget);


  await tester.tap(find.widgetWithText(TextButton, "SIGN UP MANUALLY"));
  await tester.pumpAndSettle();
}
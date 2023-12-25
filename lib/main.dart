import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smartspend/pages/onboardingpage.dart';
import 'package:smartspend/backend/wyrm/database.dart';
import 'package:smartspend/backend/user.dart';
import 'package:smartspend/backend/category.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

import 'backend/notifications.dart';

void main() async {
  Wyrm database = Wyrm();
  User client = await initClient(database);
  await initCategories(database, client);
  await initNotifications();
  goFullscreen();
  runApp(MyApp(client: client));
}

Future<void> initNotifications() async { //this code is based on the documentation from the package
  AwesomeNotifications().initialize(
    // set the icon to null if you want to use the default app icon
      'assets/logo.png',
      [
        NotificationChannel(
            channelGroupKey: 'smartspend_notification_group',
            channelKey: 'smartspend_notification_channel',
            channelName: 'Smartspend Notifications',
            channelDescription: 'Notification channel for Smartspend app',
            defaultColor: Color(0xFF9D50DD),
            ledColor: Colors.white)
      ],
      debug: true
  );
  AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
    if (!isAllowed) {
      AwesomeNotifications().requestPermissionToSendNotifications();
    }
  });
}

void goFullscreen() async {
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.immersive,
    overlays: [SystemUiOverlay.top],
  );
  while (true) {
    await SystemChrome.setSystemUIChangeCallback(
            (systemOverlaysAreVisible) async {
          await Future.delayed(Duration(seconds: 5));
          SystemChrome.setEnabledSystemUIMode(
            SystemUiMode.immersive,
            overlays: [SystemUiOverlay.top],
          );
        }
    );
  }
}

class MyApp extends StatefulWidget {
  User client;
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  MyApp({super.key, required this.client});

  @override
  State<StatefulWidget> createState() => _MyApp();
}

class _MyApp extends State<MyApp> {


  @override
  void initState() {

    // Only after at least the action method is set, the notification events are delivered
    AwesomeNotifications().setListeners(
        onActionReceivedMethod:         NotificationController.onActionReceivedMethod,
        onNotificationCreatedMethod:    NotificationController.onNotificationCreatedMethod,
        onNotificationDisplayedMethod:  NotificationController.onNotificationDisplayedMethod,
        onDismissActionReceivedMethod:  NotificationController.onDismissActionReceivedMethod
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      navigatorKey: MyApp.navigatorKey,
      home: BoardingPage(
        client: widget.client,
      ),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
    );
  }
}

Future<User> initClient(Wyrm database) async {
  User client;
  try {
    client = (await database.users()).first;
  } catch (e) {
    client = User(
      userID: 1,
      name: "",
      passcode: "",
      birthDate: "",
      newUser: 0,
      monthlyIncome: 30000);
    database.insertToTable(client, 'user');
  }
  return client;
}

Future<List<Category>> initCategories(Wyrm database, User client) async {
  List<Category> categories = await database.categories();
  if (categories.length < 4){
    categories = [
      Category(
        userID: client.userID,
        categoryID: 0,
        categoryName: 'Food',
        categoryColor: Colors.blue.value,
        spendingLimit: 10000,
        currentSpending: 0,
      ),
      Category(
        userID: client.userID,
        categoryID: 1,
        categoryName: 'Entertainment',
        categoryColor: Colors.green.shade600.value,
        spendingLimit: 10000,
        currentSpending: 0,
      ),
      Category(
        userID: client.userID,
        categoryID: 2,
        categoryName: 'Medical',
        categoryColor: Colors.orangeAccent.value,
        spendingLimit: 10000,
        currentSpending: 0,
      ),
      Category(
        userID: client.userID,
        categoryID: 3,
        categoryName: 'Transportation',
        categoryColor: Colors.blueGrey.shade600.value,
        spendingLimit: 10000,
        currentSpending: 0,
      )
    ];
    for (int i = 0; i < categories.length; i++){
      await database.insertToTable(categories[i], 'category');
    }
  }
  return categories;
}
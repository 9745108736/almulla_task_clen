import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import 'features/home/presentation/pages/encrypt/encrypt_test.dart';
import 'features/home/presentation/pages/landing/demo_landing.dart';
import 'features/home/presentation/pages/todo/model/todo.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

Box? box;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  box = await Hive.openBox<Books>("tododata");
  Hive.registerAdapter(BooksAdapter());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Number Trivia',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.green.shade800,
        accentColor: Colors.green.shade600,
      ),
      home: const DemoLandingPage(),
      // home: HomeView(),
      // home: const MyBooks(),
    );
  }
}

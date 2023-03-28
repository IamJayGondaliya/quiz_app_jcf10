import 'package:flutter/material.dart';
import 'package:quiz_app_jcf10/views/screens/home_page.dart';
import 'package:quiz_app_jcf10/views/screens/result_page.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => const HomePage(),
        'result_page': (context) => const ResultPage(),
      },
    );
  }
}

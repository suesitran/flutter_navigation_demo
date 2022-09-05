import 'package:flutter/material.dart';
import 'package:flutter_navigation_demo/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Navigation Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: const SinglePage(),
    );
  }
}

class SinglePage extends StatelessWidget {
  const SinglePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('Flutter navigation Demo'),
    ),
    body: Center(
      child: ElevatedButton(
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const MainPage())),
        child: const Text('Go to multitab page'),
      ),
    ),
  );
}


import 'package:flutter/material.dart';

class NavigatorMainPage extends StatelessWidget {

  const NavigatorMainPage({Key? key, required this.label}) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: '/',
      onGenerateRoute: _generateRoute,
    );
  }

  Route<dynamic> _generateRoute(RouteSettings settings) {
    if (settings.name == '/') {
      return MaterialPageRoute(
          builder: (context) => MainPage(label: label)
      );
    }

    return MaterialPageRoute(
      builder: (context) {
        return SubPage(label: label,);
      },
    );
  }
}

class MainPage extends StatelessWidget {
  final String label;

  const MainPage({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) => PageView(
    children: [
      ContentPage(label: '$label - Content 1'),
      ContentPage(label: '$label - Content 2')
    ],
  );
}

class ContentPage extends StatelessWidget {

  final String label;

  const ContentPage({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(label),
          TextButton(onPressed: () => Navigator.of(context).pushNamed('sub page'), child: Text('Go to sub page'))
        ],
      ),
    );
  }
}

class SubPage extends StatelessWidget {

  final String label;

  const SubPage({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        Center(
          child: Text('Sub $label - 1'),
        ),
        Center(
          child: Text('Sub $label - 2'),
        )
      ],
    );
  }
}


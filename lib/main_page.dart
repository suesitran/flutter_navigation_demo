import 'package:flutter/material.dart';
import 'package:flutter_navigation_demo/page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {

  late final TabController _pageController;

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();

    _pageController = TabController(length: 2, vsync: this)
      ..addListener(() {
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation demo'),
      ),
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: const [
          NavigatorMainPage(label: 'Page 1'),
          NavigatorMainPage(label: 'Page 2')
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Page 1'),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Page 2')
        ],
        onTap: (value) {
          setState(() {
            _currentIndex = value;
            _pageController.animateTo(_currentIndex);
          });
        },
      ),
    );
  }
}

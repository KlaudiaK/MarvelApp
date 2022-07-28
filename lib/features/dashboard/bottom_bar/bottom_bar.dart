import 'package:flutter/material.dart';
import 'package:marvel_app/features/dashboard/home/comic_list_page.dart';
import 'package:marvel_app/features/dashboard/search/search_page.dart';
import 'package:marvel_app/utils/strings.dart';

class DashboardTabs extends StatefulWidget {
  const DashboardTabs({Key? key}) : super(key: key);

  @override
  State<DashboardTabs> createState() => _DashboardTabsState();
}

class _DashboardTabsState extends State<DashboardTabs> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    ComicListScreen(),
    const SearchPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            StringResource.top_app_bar_text,
            style: TextStyle(fontSize: 24),
          ),
          centerTitle: false,
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home), label: StringResource.empty_string),
            BottomNavigationBarItem(
                icon: Icon(Icons.search), label: StringResource.empty_string),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          onTap: _onItemTapped,
        ),
        body: Center(child: _widgetOptions[_selectedIndex]));
  }
}

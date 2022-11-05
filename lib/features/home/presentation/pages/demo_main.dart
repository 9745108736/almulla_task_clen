import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import '../../../../core/utils/colors.dart';
import '../widgets/button_widget.dart';
import '../widgets/space_widget.dart';
import '../widgets/text_field_widget.dart';
import '../widgets/text_widget.dart';
import 'demo_home.dart';
import 'demo_todo.dart';

class DemoMainPage extends StatefulWidget {
  const DemoMainPage({Key? key}) : super(key: key);

  @override
  State<DemoMainPage> createState() => _DemoMainPageState();
}

class _DemoMainPageState extends State<DemoMainPage> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    DemoHomePage(),
    TodoPage(),
    DemoHomePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kGoodPurple,
        title: DemoRobotoTextWidget(text: "Welcome user",fontColor: kGoodMidGray),
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Text("Hello User"),
            ),
            const Divider(),
            ListTile(
              leading: Icon(
                Icons.home,
              ),
              title: const Text('Change Language'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.logout,
              ),
              title: const Text('Logout'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: kGoodPurple,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: ('Encryption'),
            activeIcon: Icon(
              Icons.lock,
              color: kGoodPurple,
            ),
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.check,
              color: kGoodLightGray,
            ),
            label: ('TODO'),
            activeIcon: Icon(
              Icons.check,
              color: kGoodPurple,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.timer_rounded,
              color: kGoodLightGray,
              size: 36,
            ),
            label: ('Stopwatch'),
            activeIcon: Icon(
              Icons.timer_rounded,
              color: kGoodPurple,
              size: 36,
            ),
          ),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}

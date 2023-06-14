import 'package:auto_pick/screens/home_screen.dart';
import 'package:auto_pick/screens/profile_display_screen.dart';
import 'package:flutter/material.dart';

class MobileLayout extends StatefulWidget {
  const MobileLayout({super.key});

  @override
  State<MobileLayout> createState() => _MobileLayoutState();
}

class _MobileLayoutState extends State<MobileLayout> {
  List page = [
    HomeScreen(),
    Text('Power'),
    ProfileDisplayScreen(),
    Text('Setting'),
  ];

  int myIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        leading: Padding(
            padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
            child: ClipOval(
              child: SizedBox.fromSize(
                size: Size.fromRadius(48),
                child: Image(
                  image: NetworkImage(
                    'https://images.unsplash.com/photo-1686297053585-f62dc5e887df?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=464&q=80',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            )),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(
              child: Container(),
              flex: 1,
            ),

            Image(
              image: AssetImage('assets/symbol.png'),
              width: MediaQuery.of(context).size.width * 0.4,
            ),
            Flexible(
              child: Container(),
              flex: 1,
            ),

            ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: SizedBox.fromSize(
                size: const Size.fromRadius(30),
                child: Image.asset(
                  'assets/paramount.jpg',
                  fit: BoxFit.contain,
                  height: 10.0,
                  width: 50.0,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.grey.shade100,
        elevation: 0,
      ),
      body: page[myIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
        child: BottomNavigationBar(
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey.withOpacity(0.5),
          showSelectedLabels: true,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              myIndex = index;
            });
          },
          currentIndex: myIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'Home',
              tooltip: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.bolt,
              ),
              label: 'Power',
              tooltip: 'Power',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              label: 'Profile',
              tooltip: 'Profile',
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                ),
                label: 'Settings',
                tooltip: 'Settings'),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'add_task.dart';
import 'home_page.dart';
import 'my_list_page.dart';
import 'settings_page.dart';
import 'package:animations/animations.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  // Only 3 pages for the first 3 tabs: Home, My List, Settings
  final List<Widget> _pages = [
    const HomePage(),
    const MyListPage(),
    const SettingsPage(),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageTransitionSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (child, animation, secondaryAnimation) {
          return FadeThroughTransition(
            animation: animation,
            secondaryAnimation: secondaryAnimation,
            child: child,
          );
        },
        // Show selected page from _pages list based on _currentIndex
        child: _pages[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) async {
          if (index == 3) {
            // Add Task button tapped — open AddTask page as modal
            final result = await Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const AddTask()),
            );
            if (result == true) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Task added successfully!')),
              );
            }
          } else {
            setState(() {
              _currentIndex = index;
            });
          }
        },
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: "My List",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: "Add Task",
          ),
        ],
      ),
    );
  }
}

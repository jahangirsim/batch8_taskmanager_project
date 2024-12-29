import 'package:batch8_taskmanager_project/ui/screens/new_task_screen.dart';
import 'package:batch8_taskmanager_project/ui/screens/progress_screen.dart';
import 'package:flutter/material.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({Key? key}) : super(key: key);

  static const String name = '/home';

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}



class _MainBottomNavScreenState extends State<MainBottomNavScreen> {

  int _selectedIndex = 0;
  List<Widget> _screens = const [
    NewTaskScreen(),
    ProgressScreen(),
    NewTaskScreen(),
    NewTaskScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens [_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
          onDestinationSelected: (int index){
          _selectedIndex = index;
          setState(() {});
        },
          destinations: const [
            NavigationDestination(icon: Icon(Icons.open_in_new_outlined), label: 'New'),
            NavigationDestination(icon: Icon(Icons.refresh_sharp), label: 'Progress'),
            NavigationDestination(icon: Icon(Icons.done), label: 'Done'),
            NavigationDestination(icon: Icon(Icons.cancel), label: 'Cancelled'),
          ]),
    );
  }
}

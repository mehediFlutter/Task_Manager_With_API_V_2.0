import 'package:flutter/material.dart';

class BottomNavBaseScreen extends StatefulWidget {
  const BottomNavBaseScreen({super.key});

  @override
  State<BottomNavBaseScreen> createState() => _BottomNavBaseScreenState();
}

class _BottomNavBaseScreenState extends State<BottomNavBaseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.grey,
          unselectedLabelStyle: const TextStyle(
            color: Colors.grey,
          ),
          showUnselectedLabels: true,
          selectedItemColor: Colors.green,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.ac_unit),label: "New"),
        BottomNavigationBarItem(icon: Icon(Icons.account_tree),label: "In Progress"),
        BottomNavigationBarItem(icon: Icon(Icons.cancel),label: "Cancel"),
        BottomNavigationBarItem(icon: Icon(Icons.done_all),label: "Completed"),
      ],
    ));
  }
}

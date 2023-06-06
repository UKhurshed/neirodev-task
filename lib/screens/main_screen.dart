import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: child),
      bottomNavigationBar: const AppBottomNavigationBar(),
    );
  }
}

class AppBottomNavigationBar extends StatelessWidget {
  const AppBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(items: const [
      BottomNavigationBarItem(icon: Icon(Icons.abc), label: 'Возраст'),
      BottomNavigationBarItem(icon: Icon(Icons.abc_outlined), label: 'Пол'),
      BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Национальность')
    ]);
  }
}

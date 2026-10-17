import 'package:flutter/material.dart';

class Task2_4App extends StatelessWidget {
  const Task2_4App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const DrawerPage(title: 'Home', currentRoute: '/'),
        '/profile': (context) => const DrawerPage(title: 'Profile', currentRoute: '/profile'),
        '/settings': (context) => const DrawerPage(title: 'Settings', currentRoute: '/settings'),
      },
    );
  }
}

class DrawerPage extends StatelessWidget {
  final String title;
  final String currentRoute;
  const DrawerPage({super.key, required this.title, required this.currentRoute});

  void _navigate(BuildContext context, String targetRoute) {
    Navigator.pop(context);
    if (currentRoute != targetRoute) {
      Navigator.pushReplacementNamed(context, targetRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text('Navigation Drawer', style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              selected: currentRoute == '/',
              onTap: () => _navigate(context, '/'),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              selected: currentRoute == '/profile',
              onTap: () => _navigate(context, '/profile'),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              selected: currentRoute == '/settings',
              onTap: () => _navigate(context, '/settings'),
            ),
          ],
        ),
      ),
      body: Center(
        child: Text('Current Screen: $title', style: const TextStyle(fontSize: 22)),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class User {
  final String name;
  final int age;
  final String city;
  const User(this.name, this.age, this.city);
}

class Task4_4App extends StatelessWidget {
  const Task4_4App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      onGenerateRoute: (settings) {
        if (settings.name == '/') {
          return MaterialPageRoute(builder: (context) => const HomeScreen());
        }
        if (settings.name == '/profile') {
          if (settings.arguments is User) {
            final user = settings.arguments as User;
            return MaterialPageRoute(builder: (context) => ProfileScreen(user: user));
          }
        }
        return null;
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: ElevatedButton(
          child: const Text('Open User via onGenerateRoute'),
          onPressed: () {
            Navigator.pushNamed(
              context,
              '/profile',
              arguments: const User('Alexander Wright', 31, 'Berlin'),
            );
          },
        ),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  final User user;
  const ProfileScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(user.name)),
      body: Center(
        child: Text('${user.name}, Age ${user.age}, City: ${user.city}',
            style: const TextStyle(fontSize: 22)),
      ),
    );
  }
}
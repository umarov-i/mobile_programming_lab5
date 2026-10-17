import 'package:flutter/material.dart';

class Task4_2App extends StatelessWidget {
  const Task4_2App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/square': (context) => const SquareScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Send a number')),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [1, 2, 3]
              .map((n) => ElevatedButton(
                    child: Text('$n', style: const TextStyle(fontSize: 20)),
                    onPressed: () => Navigator.pushNamed(context, '/square', arguments: n),
                  ))
              .toList(),
        ),
      ),
    );
  }
}

class SquareScreen extends StatelessWidget {
  const SquareScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final number = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      appBar: AppBar(title: const Text('Square')),
      body: Center(
        child: Text(
          'Number: $number\nSquare: ${number * number}',
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 28),
        ),
      ),
    );
  }
}
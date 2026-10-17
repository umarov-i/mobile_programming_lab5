import 'package:flutter/material.dart';

class Task5_3App extends StatelessWidget {
  const Task5_3App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Slide from bottom')),
      body: Center(
        child: ElevatedButton(
          child: const Text('Open as a sheet'),
          onPressed: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                transitionDuration: const Duration(milliseconds: 500),
                pageBuilder: (context, anim, secAnim) => const SheetScreen(),
                transitionsBuilder: (context, anim, secAnim, child) {
                  final curved = CurvedAnimation(parent: anim, curve: Curves.easeOut);
                  return SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(0, 1),
                      end: Offset.zero,
                    ).animate(curved),
                    child: child,
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class SheetScreen extends StatelessWidget {
  const SheetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sheet Screen')),
      body: const Center(child: Text('Slid in from bottom!', style: TextStyle(fontSize: 22))),
    );
  }
}
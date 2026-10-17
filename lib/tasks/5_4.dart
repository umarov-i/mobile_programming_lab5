import 'package:flutter/material.dart';

class Task5_4App extends StatelessWidget {
  const Task5_4App({super.key});

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
      appBar: AppBar(title: const Text('Scale & Fade')),
      body: Center(
        child: ElevatedButton(
          child: const Text('Scale and fade together'),
          onPressed: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, anim, secAnim) => const DetailsScreen(),
                transitionsBuilder: (context, anim, secAnim, child) {
                  final scaleAnim = Tween<double>(begin: 0.8, end: 1.0).animate(anim);
                  return FadeTransition(
                    opacity: anim,
                    child: ScaleTransition(scale: scaleAnim, child: child),
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

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Details')),
      body: const Center(child: Text('Scaled & Faded together!', style: TextStyle(fontSize: 22))),
    );
  }
}
import 'package:flutter/cupertino.dart'; // <-- 1. Required for CupertinoPageTransitionsBuilder
import 'package:flutter/material.dart';

// 1. Reusable FadeRoute
class FadeRoute extends PageRouteBuilder {
  final Widget page;
  FadeRoute(this.page)
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              FadeTransition(opacity: animation, child: child),
        );
}

class Task5_5App extends StatelessWidget {
  const Task5_5App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 2. Global theme for the whole app
      theme: ThemeData(
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          },
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Global Transitions')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              child: const Text('Push with custom FadeRoute'),
              onPressed: () => Navigator.push(context, FadeRoute(const DetailsScreen())),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              child: const Text('Push with standard MaterialPageRoute'),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DetailsScreen()),
              ),
            ),
          ],
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
      body: const Center(
        child: Text('Subscreen reached', style: TextStyle(fontSize: 22)),
      ),
    );
  }
}
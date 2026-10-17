import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Helper function that builds custom slide + scale transition
CustomTransitionPage<void> buildPage({required LocalKey key, required Widget child}) {
  return CustomTransitionPage<void>(
    key: key,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final slide = Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero).animate(animation);
      final scale = Tween<double>(begin: 0.8, end: 1.0).animate(animation);
      return SlideTransition(
        position: slide,
        child: ScaleTransition(scale: scale, child: child),
      );
    },
  );
}

class Task6_5App extends StatelessWidget {
  const Task6_5App({super.key});

  static final _router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        pageBuilder: (context, state) => buildPage(key: state.pageKey, child: const HomeScreen()),
      ),
      GoRoute(
        path: '/details',
        pageBuilder: (context, state) => buildPage(key: state.pageKey, child: const DetailsScreen()),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: _router);
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
          child: const Text('Open Details (Slide & Scale)'),
          onPressed: () => context.push('/details'),
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
      body: const Center(child: Text('Slide & Scale transition!', style: TextStyle(fontSize: 22))),
    );
  }
}
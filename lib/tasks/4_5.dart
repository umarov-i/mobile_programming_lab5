import 'package:flutter/material.dart';

class Task4_5App extends StatelessWidget {
  const Task4_5App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const MovieHomeScreen(),
        '/rate': (context) => const RateScreen(),
      },
    );
  }
}

class MovieHomeScreen extends StatefulWidget {
  const MovieHomeScreen({super.key});

  @override
  State<MovieHomeScreen> createState() => _MovieHomeScreenState();
}

class _MovieHomeScreenState extends State<MovieHomeScreen> {
  final String movieTitle = 'Interstellar';
  int? rating;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Movie Rating')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              rating != null ? '$movieTitle: $rating/5' : '$movieTitle: Not rated yet',
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('Rate Movie'),
              onPressed: () async {
                final result = await Navigator.pushNamed<int>(
                  context,
                  '/rate',
                  arguments: movieTitle,
                );
                if (!context.mounted) return;
                if (result != null) {
                  setState(() => rating = result);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class RateScreen extends StatelessWidget {
  const RateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final title = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(title: Text('Rate $title')),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(5, (index) {
            final score = index + 1;
            return IconButton(
              icon: const Icon(Icons.star, color: Colors.amber, size: 40),
              onPressed: () => Navigator.pop(context, score),
            );
          }),
        ),
      ),
    );
  }
}
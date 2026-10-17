import 'package:flutter/material.dart';

class Task3_5App extends StatelessWidget {
  const Task3_5App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CounterHomeScreen(),
    );
  }
}

class CounterHomeScreen extends StatefulWidget {
  const CounterHomeScreen({super.key});

  @override
  State<CounterHomeScreen> createState() => _CounterHomeScreenState();
}

class _CounterHomeScreenState extends State<CounterHomeScreen> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter Screen')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Current value: $_counter', style: const TextStyle(fontSize: 28)),
            const SizedBox(height: 16),
            ElevatedButton(
              child: const Text('Edit Counter'),
              onPressed: () async {
                final result = await Navigator.push<int>(
                  context,
                  MaterialPageRoute(builder: (context) => EditorScreen(initialValue: _counter)),
                );
                if (!context.mounted) return;
                if (result != null) {
                  setState(() => _counter = result);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class EditorScreen extends StatefulWidget {
  final int initialValue;
  const EditorScreen({super.key, required this.initialValue});

  @override
  State<EditorScreen> createState() => _EditorScreenState();
}

class _EditorScreenState extends State<EditorScreen> {
  late int _editedValue;

  @override
  void initState() {
    super.initState();
    _editedValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Counter')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Value: $_editedValue', style: const TextStyle(fontSize: 32)),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(icon: const Icon(Icons.remove, size: 30), onPressed: () => setState(() => _editedValue--)),
                const SizedBox(width: 24),
                IconButton(icon: const Icon(Icons.add, size: 30), onPressed: () => setState(() => _editedValue++)),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              child: const Text('Save'),
              onPressed: () => Navigator.pop(context, _editedValue),
            ),
          ],
        ),
      ),
    );
  }
}
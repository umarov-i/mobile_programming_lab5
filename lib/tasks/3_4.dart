import 'package:flutter/material.dart';

class Task3_4App extends StatelessWidget {
  const Task3_4App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ColorPickerHomeScreen(),
    );
  }
}

class ColorPickerHomeScreen extends StatefulWidget {
  const ColorPickerHomeScreen({super.key});

  @override
  State<ColorPickerHomeScreen> createState() => _ColorPickerHomeScreenState();
}

class _ColorPickerHomeScreenState extends State<ColorPickerHomeScreen> {
  Color _currentColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pick a colour')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(width: 120, height: 120, color: _currentColor),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('Choose colour'),
              onPressed: () async {
                final selected = await Navigator.push<Color>(
                  context,
                  MaterialPageRoute(builder: (context) => const ColorOptionsScreen()),
                );
                if (!context.mounted) return;
                if (selected != null) {
                  setState(() => _currentColor = selected);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ColorOptionsScreen extends StatelessWidget {
  const ColorOptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Choose a Colour')),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () => Navigator.pop(context, Colors.red),
              child: const Text('Red', style: TextStyle(color: Colors.white)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              onPressed: () => Navigator.pop(context, Colors.green),
              child: const Text('Green', style: TextStyle(color: Colors.white)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              onPressed: () => Navigator.pop(context, Colors.blue),
              child: const Text('Blue', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
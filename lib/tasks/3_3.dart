import 'package:flutter/material.dart';

class Contact {
  final String name;
  final String phone;
  final String email;
  const Contact(this.name, this.phone, this.email);
}

final sampleContacts = [
  const Contact('Mardon Hazratov', '+1 555-0101', 'm.hazratov@newuu.uz'),
  const Contact('Ilnur Yamaletdinov', '+1 555-0102', 'i.yamaletdinov@newuu.uz'),
  const Contact('Otabek Abdumalikov', '+1 555-0103', 'o.andumalikov@newuu.uz'),
  const Contact('Muhammad Usmonov', '+1 555-0104', 'm.usmonov@newuu.uz'),
  const Contact('Abdulbosit Xolikov', '+1 555-0105', 'a.xolikov@newuu.uz'),
];

class Task3_3App extends StatelessWidget {
  const Task3_3App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ContactListScreen(),
    );
  }
}

class ContactListScreen extends StatelessWidget {
  const ContactListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contacts')),
      body: ListView.builder(
        itemCount: sampleContacts.length,
        itemBuilder: (context, index) {
          final contact = sampleContacts[index];
          return ListTile(
            leading: CircleAvatar(child: Text(contact.name[0])),
            title: Text(contact.name),
            subtitle: Text(contact.phone),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ContactScreen(contact: contact)),
            ),
          );
        },
      ),
    );
  }
}

class ContactScreen extends StatelessWidget {
  final Contact contact;
  const ContactScreen({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(contact.name)),
      body: Center(
        child: Card(
          elevation: 4,
          margin: const EdgeInsets.all(24),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(contact.name, style: Theme.of(context).textTheme.headlineSmall),
                const Divider(),
                const SizedBox(height: 8),
                Text('Phone: ${contact.phone}', style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 8),
                Text('Email: ${contact.email}', style: const TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
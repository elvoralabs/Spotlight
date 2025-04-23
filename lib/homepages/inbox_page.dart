import 'package:flutter/material.dart';

class InboxPage extends StatelessWidget {
  final List<Map<String, String>> chats = [
    {
      'name': 'Semiloore',
      'message': 'See you tomorrow!',
      'time': '9:41 AM',
    },
    {
      'name': 'James',
      'message': 'Let’s start that Flutter project.',
      'time': '8:15 AM',
    },
    {
      'name': 'Mum',
      'message': 'Don’t forget the meeting!',
      'time': 'Yesterday',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
        backgroundColor: Color(0xFF075E54),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) {
          final chat = chats[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.grey[300],
              child: Text(chat['name']![0]),
            ),
            title: Text(chat['name']!,
                style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(chat['message']!),
            trailing: Text(chat['time']!,
                style: TextStyle(color: Colors.grey, fontSize: 12)),
            onTap: () {
              // Navigate to chat details screen
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF25D366),
        child: Icon(Icons.chat),
        onPressed: () {
          // New chat action
        },
      ),
    );
  }
}

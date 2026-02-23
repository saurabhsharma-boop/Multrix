import 'package:flutter/material.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Messages')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          ListTile(
            leading: CircleAvatar(child: Icon(Icons.group)),
            title: Text('Baithak Gamers Club'),
            subtitle: Text('Squad forming for tonight\'s tournament.'),
          ),
          ListTile(
            leading: CircleAvatar(child: Icon(Icons.person)),
            title: Text('Priya'),
            subtitle: Text('Hey! Join my room at 9 PM.'),
          ),
          ListTile(
            leading: CircleAvatar(child: Icon(Icons.security)),
            title: Text('Safety Center'),
            subtitle: Text('Report, block, and moderation actions are available here.'),
          ),
        ],
      ),
    );
  }
}

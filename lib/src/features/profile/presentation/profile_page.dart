import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const ListTile(
            leading: CircleAvatar(radius: 30, child: Icon(Icons.person)),
            title: Text('Aarav_47'),
            subtitle: Text('Level 14 • VIP Gold • Hindi/English'),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              _StatChip(label: 'Followers', value: '2.3K'),
              _StatChip(label: 'Following', value: '481'),
              _StatChip(label: 'Streak', value: '17d'),
            ],
          ),
          const SizedBox(height: 20),
          const Card(
            child: ListTile(
              leading: Icon(Icons.workspace_premium_rounded),
              title: Text('VIP & Coins Wallet'),
              subtitle: Text('Razorpay hooks are ready for top-ups and subscriptions.'),
            ),
          ),
          const Card(
            child: ListTile(
              leading: Icon(Icons.emoji_events_rounded),
              title: Text('Achievements & Badges'),
              subtitle: Text('Gamification and host ranking modules are integrated at architecture level.'),
            ),
          ),
        ],
      ),
    );
  }
}

class _StatChip extends StatelessWidget {
  const _StatChip({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value, style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
        Text(label),
      ],
    );
  }
}

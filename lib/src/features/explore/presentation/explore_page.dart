import 'package:flutter/material.dart';

import '../../../core/constants/app_strings.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Explore')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.search),
              hintText: 'Search rooms, hosts, communities',
            ),
          ),
          const SizedBox(height: 20),
          Text('Categories', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 12),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: AppStrings.roomCategories
                .map((category) => Chip(avatar: const Icon(Icons.tag), label: Text(category)))
                .toList(),
          ),
          const SizedBox(height: 20),
          Card(
            child: ListTile(
              leading: const Icon(Icons.shuffle_rounded),
              title: const Text('Random Voice Connect'),
              subtitle: const Text('Instantly match with people by language or interest.'),
              trailing: FilledButton(onPressed: () {}, child: const Text('Start')),
            ),
          ),
          const Card(
            child: ListTile(
              leading: Icon(Icons.auto_awesome_rounded),
              title: Text('AI Recommendations'),
              subtitle: Text('Algorithm-ready feed hooks are scaffolded for personalized discovery.'),
            ),
          ),
        ],
      ),
    );
  }
}

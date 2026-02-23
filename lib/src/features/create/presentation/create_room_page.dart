import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/providers.dart';
import '../../../core/constants/app_strings.dart';

class CreateRoomPage extends ConsumerStatefulWidget {
  const CreateRoomPage({super.key});

  @override
  ConsumerState<CreateRoomPage> createState() => _CreateRoomPageState();
}

class _CreateRoomPageState extends ConsumerState<CreateRoomPage> {
  final _titleController = TextEditingController();
  String _category = 'Fun';
  String _language = 'Hindi';
  bool _isPrivate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Room')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextField(controller: _titleController, decoration: const InputDecoration(labelText: 'Room title')),
          const SizedBox(height: 12),
          DropdownButtonFormField<String>(
            value: _category,
            items: AppStrings.roomCategories.map((item) => DropdownMenuItem(value: item, child: Text(item))).toList(),
            onChanged: (v) => setState(() => _category = v ?? _category),
            decoration: const InputDecoration(labelText: 'Category'),
          ),
          const SizedBox(height: 12),
          DropdownButtonFormField<String>(
            value: _language,
            items: AppStrings.supportedLanguages.map((item) => DropdownMenuItem(value: item, child: Text(item))).toList(),
            onChanged: (v) => setState(() => _language = v ?? _language),
            decoration: const InputDecoration(labelText: 'Language'),
          ),
          SwitchListTile(
            value: _isPrivate,
            onChanged: (value) => setState(() => _isPrivate = value),
            title: const Text('Private / Invite-only room'),
          ),
          FilledButton(
            onPressed: () async {
              await ref.read(roomRepositoryProvider).createRoom(
                    title: _titleController.text,
                    category: _category,
                    language: _language,
                    isPrivate: _isPrivate,
                  );
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Room created (mock).')));
              }
            },
            child: const Text('Create now'),
          ),
          const SizedBox(height: 12),
          const Text('Scheduled rooms, creator tools, and agency controls can be attached in this module.'),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../core/models/voice_room.dart';

class RoomCard extends StatelessWidget {
  const RoomCard({super.key, required this.room, required this.onTap});

  final VoiceRoom room;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: onTap,
        title: Text(room.title),
        subtitle: Text('${room.hostName} • ${room.language} • ${room.category}'),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.graphic_eq_rounded),
            Text('${room.listeners}'),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/providers.dart';

class VoiceRoomPage extends ConsumerStatefulWidget {
  const VoiceRoomPage({super.key, required this.roomId});

  final String roomId;

  @override
  ConsumerState<VoiceRoomPage> createState() => _VoiceRoomPageState();
}

class _VoiceRoomPageState extends ConsumerState<VoiceRoomPage> {
  bool muted = false;

  @override
  void initState() {
    super.initState();
    Future<void>.microtask(() => ref.read(voiceEngineServiceProvider).joinRoom(widget.roomId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Room ${widget.roomId}'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.rule_folder_rounded)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.person_add_alt_1_rounded)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Mic Seats (8–12)', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 12),
            GridView.builder(
              shrinkWrap: true,
              itemCount: 8,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.85,
              ),
              itemBuilder: (context, index) => Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(child: Text('${index + 1}')),
                    const SizedBox(height: 6),
                    Text(index == 0 ? 'Host' : 'Seat ${index + 1}'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                FilledButton.icon(
                  onPressed: () async {
                    setState(() => muted = !muted);
                    await ref.read(voiceEngineServiceProvider).muteMic(muted);
                  },
                  icon: Icon(muted ? Icons.mic_off : Icons.mic),
                  label: Text(muted ? 'Unmute' : 'Mute'),
                ),
                const SizedBox(width: 8),
                OutlinedButton(
                  onPressed: () => ref.read(voiceEngineServiceProvider).raiseHand(widget.roomId),
                  child: const Text('Raise Hand'),
                ),
                const SizedBox(width: 8),
                OutlinedButton(onPressed: () {}, child: const Text('Gift Battle')),
              ],
            ),
            const SizedBox(height: 12),
            const Text('Audience & room chat panel placeholder. Add FCM events, moderation, and AI hooks here.'),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    ref.read(voiceEngineServiceProvider).leaveRoom(widget.roomId);
    super.dispose();
  }
}

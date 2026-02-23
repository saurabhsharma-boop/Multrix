import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/providers.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/models/voice_room.dart';
import '../../rooms/presentation/widgets/room_card.dart';
import '../../shared/widgets/section_title.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  String selectedLanguage = 'Hindi';

  @override
  Widget build(BuildContext context) {
    final repo = ref.watch(roomRepositoryProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Home')), 
      body: FutureBuilder<List<VoiceRoom>>(
        future: repo.fetchTrendingRooms(),
        builder: (context, trendingSnapshot) {
          final trending = trendingSnapshot.data ?? const <VoiceRoom>[];
          return FutureBuilder<List<VoiceRoom>>(
            future: repo.fetchNewRooms(),
            builder: (context, newSnapshot) {
              final newRooms = newSnapshot.data ?? const <VoiceRoom>[];
              return ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  const Text('Discover live addas, games, and voices across India.'),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 8,
                    children: AppStrings.supportedLanguages
                        .map(
                          (lang) => ChoiceChip(
                            selected: lang == selectedLanguage,
                            label: Text(lang),
                            onSelected: (_) => setState(() => selectedLanguage = lang),
                          ),
                        )
                        .toList(),
                  ),
                  const SizedBox(height: 20),
                  const SectionTitle(title: 'Trending Rooms'),
                  ...trending
                      .where((room) => room.language == selectedLanguage || selectedLanguage == 'Hindi')
                      .map((room) => RoomCard(room: room, onTap: () => context.push('/room/${room.id}'))),
                  const SizedBox(height: 16),
                  const SectionTitle(title: 'New Rooms'),
                  ...newRooms.map((room) => RoomCard(room: room, onTap: () => context.push('/room/${room.id}'))),
                ],
              );
            },
          );
        },
      ),
    );
  }
}

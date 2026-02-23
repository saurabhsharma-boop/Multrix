import '../models/voice_room.dart';

abstract class RoomRepository {
  Future<List<VoiceRoom>> fetchTrendingRooms();
  Future<List<VoiceRoom>> fetchNewRooms();
  Future<List<VoiceRoom>> fetchByCategory(String category);
  Future<void> createRoom({
    required String title,
    required String category,
    required String language,
    required bool isPrivate,
  });
}

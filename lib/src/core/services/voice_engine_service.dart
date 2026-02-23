enum VoiceProvider { zegocloud, agora }

abstract class VoiceEngineService {
  VoiceProvider get provider;
  Future<void> joinRoom(String roomId, {bool asHost = false});
  Future<void> leaveRoom(String roomId);
  Future<void> muteMic(bool muted);
  Future<void> raiseHand(String roomId);
}

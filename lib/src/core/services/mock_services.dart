import 'dart:async';

import '../models/voice_room.dart';
import '../repositories/auth_repository.dart';
import '../repositories/room_repository.dart';
import 'payment_service.dart';
import 'voice_engine_service.dart';

class MockAuthRepository implements AuthRepository {
  @override
  Future<void> signInWithGoogle() async => Future<void>.delayed(const Duration(milliseconds: 400));

  @override
  Future<void> signInWithPhoneOtp(String phoneNumber) async => Future<void>.delayed(const Duration(milliseconds: 400));

  @override
  Future<void> signOut() async => Future<void>.delayed(const Duration(milliseconds: 200));

  @override
  Future<void> verifyOtp(String otpCode) async => Future<void>.delayed(const Duration(milliseconds: 500));
}

class MockRoomRepository implements RoomRepository {
  static const _rooms = [
    VoiceRoom(
      id: 'r1',
      title: 'Late Night Chai Adda',
      hostName: 'RJ Aditi',
      category: 'Fun',
      language: 'Hindi',
      listeners: 420,
      isTrending: true,
    ),
    VoiceRoom(
      id: 'r2',
      title: 'Indie Music Jamming',
      hostName: 'Nikhil Beats',
      category: 'Music',
      language: 'English',
      listeners: 196,
      isTrending: true,
    ),
    VoiceRoom(
      id: 'r3',
      title: 'BGMI Squad Finder',
      hostName: 'GameOn',
      category: 'Gaming',
      language: 'Hindi',
      listeners: 151,
      isTrending: false,
    ),
  ];

  @override
  Future<void> createRoom({required String title, required String category, required String language, required bool isPrivate}) async {
    await Future<void>.delayed(const Duration(milliseconds: 500));
  }

  @override
  Future<List<VoiceRoom>> fetchByCategory(String category) async {
    await Future<void>.delayed(const Duration(milliseconds: 250));
    return _rooms.where((room) => room.category == category).toList();
  }

  @override
  Future<List<VoiceRoom>> fetchNewRooms() async {
    await Future<void>.delayed(const Duration(milliseconds: 250));
    return _rooms;
  }

  @override
  Future<List<VoiceRoom>> fetchTrendingRooms() async {
    await Future<void>.delayed(const Duration(milliseconds: 250));
    return _rooms.where((room) => room.isTrending).toList();
  }
}

class MockVoiceEngineService implements VoiceEngineService {
  @override
  VoiceProvider get provider => VoiceProvider.zegocloud;

  @override
  Future<void> joinRoom(String roomId, {bool asHost = false}) async => Future<void>.delayed(const Duration(milliseconds: 350));

  @override
  Future<void> leaveRoom(String roomId) async => Future<void>.delayed(const Duration(milliseconds: 250));

  @override
  Future<void> muteMic(bool muted) async => Future<void>.delayed(const Duration(milliseconds: 150));

  @override
  Future<void> raiseHand(String roomId) async => Future<void>.delayed(const Duration(milliseconds: 150));
}

class MockPaymentService implements PaymentService {
  @override
  Future<void> openRazorpayCheckout({required int amountInPaise, required String purpose}) async =>
      Future<void>.delayed(const Duration(milliseconds: 300));
}

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/repositories/auth_repository.dart';
import '../core/repositories/room_repository.dart';
import '../core/services/mock_services.dart';
import '../core/services/payment_service.dart';
import '../core/services/voice_engine_service.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) => MockAuthRepository());
final roomRepositoryProvider = Provider<RoomRepository>((ref) => MockRoomRepository());
final voiceEngineServiceProvider = Provider<VoiceEngineService>((ref) => MockVoiceEngineService());
final paymentServiceProvider = Provider<PaymentService>((ref) => MockPaymentService());

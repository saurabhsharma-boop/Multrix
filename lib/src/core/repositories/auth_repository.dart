abstract class AuthRepository {
  Future<void> signInWithPhoneOtp(String phoneNumber);
  Future<void> verifyOtp(String otpCode);
  Future<void> signInWithGoogle();
  Future<void> signOut();
}

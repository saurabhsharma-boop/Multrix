abstract class PaymentService {
  Future<void> openRazorpayCheckout({
    required int amountInPaise,
    required String purpose,
  });
}

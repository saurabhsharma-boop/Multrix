import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/providers.dart';

class AuthGatePage extends ConsumerWidget {
  const AuthGatePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final phoneController = TextEditingController();

    Future<void> signInWithPhone() async {
      await ref.read(authRepositoryProvider).signInWithPhoneOtp(phoneController.text);
      if (context.mounted) context.go('/home');
    }

    Future<void> signInWithGoogle() async {
      await ref.read(authRepositoryProvider).signInWithGoogle();
      if (context.mounted) context.go('/home');
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              Text('Baithak', style: Theme.of(context).textTheme.displaySmall?.copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text('India\'s Online Adda', style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 28),
              TextField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(labelText: 'Phone number with +91'),
              ),
              const SizedBox(height: 12),
              FilledButton(onPressed: signInWithPhone, child: const Text('Continue with OTP')),
              const SizedBox(height: 12),
              OutlinedButton.icon(
                onPressed: signInWithGoogle,
                icon: const Icon(Icons.g_mobiledata_rounded),
                label: const Text('Continue with Google'),
              ),
              const Spacer(),
              Text(
                'Starter auth flow is wired with mock repositories. Replace providers with Firebase Auth + Phone OTP and Google Sign-In.',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

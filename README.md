# Baithak – India's Online Adda (Flutter Starter)

Production-minded starter implementation for a **voice-first social entertainment super app**.

## Implemented Foundations

- Flutter app with dark premium UI and bottom-tab navigation (Home, Explore, Create, Messages, Profile).
- Clean, modular folder structure with separated core services/repositories and feature modules.
- Architecture-ready abstractions for:
  - Firebase Auth/Firestore/Storage/FCM
  - Voice engine (ZEGOCLOUD/Agora interchangeable adapter)
  - Razorpay checkout flow
- Discovery experience:
  - Trending rooms
  - New rooms
  - Category and language filtering
  - Search entry point
- Room experience:
  - Mic seat grid (8 seats scaffolded)
  - Host controls placeholders
  - Mute/unmute and raise hand actions
  - Invite/rules action hooks
- Social and ecosystem placeholders:
  - Messages list (private/group/system)
  - Profile module (VIP, achievements, stats)
  - Random connect and AI recommendation hooks

## Architecture (Scalable Starter)

```
lib/
  src/
    app/                # App shell, router, DI providers
    core/
      constants/        # Static app metadata
      models/           # Core entities (voice room, profile)
      repositories/     # Domain repository contracts
      services/         # SDK integrations + mock adapters
      theme/            # Design system
    features/
      auth/
      home/
      explore/
      create/
      rooms/
      messages/
      profile/
      shared/
```

## Integration Plan (Next Steps)

1. Replace mock providers with Firebase-backed implementations.
2. Add state management per feature (Riverpod Notifiers + DTO mapping).
3. Integrate ZEGOCLOUD or Agora with token server for secure join flow.
4. Add Razorpay order creation via Cloud Functions.
5. Implement moderation pipeline (reports + anti-spam + AI toxicity checks).
6. Add gamification storage models (XP, streaks, rewards, leaderboards).
7. Add virtual economy models (coins ledger, gift catalog, subscription entitlements).
8. Add analytics events and admin dashboard API.

## Future-Ready Modules

- AI moderation / classification hooks
- AI hosts and bot participation
- Voice translation pipeline
- Mini games container inside rooms
- Video room evolution support
- Agency and creator monetization controls

## Run

```bash
flutter pub get
flutter run
```


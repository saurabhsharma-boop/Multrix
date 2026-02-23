import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/auth/presentation/auth_gate_page.dart';
import '../features/create/presentation/create_room_page.dart';
import '../features/explore/presentation/explore_page.dart';
import '../features/home/presentation/home_page.dart';
import '../features/messages/presentation/messages_page.dart';
import '../features/profile/presentation/profile_page.dart';
import '../features/rooms/presentation/voice_room_page.dart';
import 'main_scaffold.dart';

final appRouter = GoRouter(
  initialLocation: '/auth',
  routes: [
    GoRoute(path: '/auth', builder: (context, state) => const AuthGatePage()),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) => MainScaffold(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(routes: [GoRoute(path: '/home', builder: (context, state) => const HomePage())]),
        StatefulShellBranch(routes: [GoRoute(path: '/explore', builder: (context, state) => const ExplorePage())]),
        StatefulShellBranch(routes: [GoRoute(path: '/create', builder: (context, state) => const CreateRoomPage())]),
        StatefulShellBranch(routes: [GoRoute(path: '/messages', builder: (context, state) => const MessagesPage())]),
        StatefulShellBranch(routes: [GoRoute(path: '/profile', builder: (context, state) => const ProfilePage())]),
      ],
    ),
    GoRoute(
      path: '/room/:id',
      builder: (context, state) => VoiceRoomPage(roomId: state.pathParameters['id']!),
    ),
  ],
);

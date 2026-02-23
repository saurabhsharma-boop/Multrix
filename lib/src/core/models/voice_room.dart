class VoiceRoom {
  const VoiceRoom({
    required this.id,
    required this.title,
    required this.hostName,
    required this.category,
    required this.language,
    required this.listeners,
    required this.isTrending,
    this.isPrivate = false,
  });

  final String id;
  final String title;
  final String hostName;
  final String category;
  final String language;
  final int listeners;
  final bool isTrending;
  final bool isPrivate;
}

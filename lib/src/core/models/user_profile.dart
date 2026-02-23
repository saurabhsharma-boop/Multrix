class UserProfile {
  const UserProfile({
    required this.uid,
    required this.username,
    required this.avatarUrl,
    required this.language,
    required this.ageGroup,
    this.gender,
    this.bio,
    this.level = 1,
    this.xp = 0,
    this.isVip = false,
  });

  final String uid;
  final String username;
  final String avatarUrl;
  final String language;
  final String ageGroup;
  final String? gender;
  final String? bio;
  final int level;
  final int xp;
  final bool isVip;
}

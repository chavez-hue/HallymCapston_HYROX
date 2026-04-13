/// feeds Firestore 컬렉션에서 읽어온 러닝 피드 아이템.
/// (freezed 미사용 — build_runner 불필요)
class RunFeedItem {
  final String id; // feedId = runId
  final String userId;
  final String userName;
  final String? userPhotoUrl;

  /// 'random' | 'custom'
  final String mode;

  /// 랜덤: 도형 이름, 커스텀: 사용자 지정 이름
  final String? shapeLabel;

  /// 0–100 (랜덤 모드 전용)
  final double shapeSimilarity;

  final double distanceKm;
  final int durationSeconds;
  final String avgPace;
  final DateTime createdAt;
  final int likeCount;
  final bool isLikedByMe;

  const RunFeedItem({
    required this.id,
    required this.userId,
    required this.userName,
    this.userPhotoUrl,
    required this.mode,
    this.shapeLabel,
    required this.shapeSimilarity,
    required this.distanceKm,
    required this.durationSeconds,
    required this.avgPace,
    required this.createdAt,
    required this.likeCount,
    required this.isLikedByMe,
  });

  RunFeedItem copyWith({
    int? likeCount,
    bool? isLikedByMe,
  }) =>
      RunFeedItem(
        id: id,
        userId: userId,
        userName: userName,
        userPhotoUrl: userPhotoUrl,
        mode: mode,
        shapeLabel: shapeLabel,
        shapeSimilarity: shapeSimilarity,
        distanceKm: distanceKm,
        durationSeconds: durationSeconds,
        avgPace: avgPace,
        createdAt: createdAt,
        likeCount: likeCount ?? this.likeCount,
        isLikedByMe: isLikedByMe ?? this.isLikedByMe,
      );
}

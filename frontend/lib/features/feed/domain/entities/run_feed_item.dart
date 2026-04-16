/// feeds Firestore 컬렉션에서 읽어온 러닝 피드 아이템.
/// (freezed 미사용 — build_runner 불필요)
class RunFeedItem {
  final String id;
  final String userId;
  final String userName;
  final String? userPhotoUrl;

  /// 사용자가 작성한 게시글 텍스트.
  final String content;

  /// 연결된 러닝 기록 ID (없으면 null).
  final String? runRecordId;

  /// 'random' | 'custom' | null (러닝 기록 미첨부)
  final String? mode;

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
  final int commentCount;

  const RunFeedItem({
    required this.id,
    required this.userId,
    required this.userName,
    this.userPhotoUrl,
    required this.content,
    this.runRecordId,
    this.mode,
    this.shapeLabel,
    this.shapeSimilarity = 0.0,
    this.distanceKm = 0.0,
    this.durationSeconds = 0,
    this.avgPace = "--'--\"",
    required this.createdAt,
    required this.likeCount,
    required this.isLikedByMe,
    this.commentCount = 0,
  });

  RunFeedItem copyWith({
    int? likeCount,
    bool? isLikedByMe,
    int? commentCount,
  }) =>
      RunFeedItem(
        id: id,
        userId: userId,
        userName: userName,
        userPhotoUrl: userPhotoUrl,
        content: content,
        runRecordId: runRecordId,
        mode: mode,
        shapeLabel: shapeLabel,
        shapeSimilarity: shapeSimilarity,
        distanceKm: distanceKm,
        durationSeconds: durationSeconds,
        avgPace: avgPace,
        createdAt: createdAt,
        likeCount: likeCount ?? this.likeCount,
        isLikedByMe: isLikedByMe ?? this.isLikedByMe,
        commentCount: commentCount ?? this.commentCount,
      );
}

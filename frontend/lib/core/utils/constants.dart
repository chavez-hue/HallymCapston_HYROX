class AppConstants {
  // Firebase collections
  static const String usersCollection = 'users';
  static const String runRecordsCollection = 'runRecords';
  static const String feedCollection = 'feed';
  static const String rankingCollection = 'ranking';

  // Shape similarity threshold (0.0 ~ 1.0)
  static const double shapeSimilarityThreshold = 0.75;

  // GPS sampling interval in milliseconds
  static const int gpsSamplingIntervalMs = 1000;

  // Minimum distance between GPS points in meters
  static const double minGpsPointDistanceM = 5.0;

  // Running modes
  static const String runModeRandom = 'RANDOM';
  static const String runModeCustom = 'CUSTOM';
}

import 'package:injectable/injectable.dart';

import '../entities/gps_point.dart';
import '../repositories/run_repository.dart';

/// Returns a live stream of GPS points to track the ongoing run.
@injectable
class StartRun {
  final RunRepository _repository;

  const StartRun(this._repository);

  Stream<GpsPoint> call() => _repository.watchGpsStream();
}

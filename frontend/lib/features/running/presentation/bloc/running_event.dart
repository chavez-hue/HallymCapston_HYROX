import 'package:freezed_annotation/freezed_annotation.dart';

part 'running_event.freezed.dart';

@freezed
sealed class RunningEvent with _$RunningEvent {
  const factory RunningEvent.startRequested({
    @Default('random') String mode,
    String? shapeLabel,
  }) = StartRequested;
  const factory RunningEvent.pauseRequested() = PauseRequested;
  const factory RunningEvent.resumeRequested() = ResumeRequested;
  const factory RunningEvent.stopRequested() = StopRequested;
  const factory RunningEvent.gpsUpdated({
    required double latitude,
    required double longitude,
    required DateTime timestamp,
  }) = GpsUpdated;
  const factory RunningEvent.timerTicked() = TimerTicked;
  const factory RunningEvent.errorOccurred(String message) = ErrorOccurred;
}

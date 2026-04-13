import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../entities/shape_mission.dart';
import '../repositories/shape_repository.dart';

@injectable
class CreateCustomShape {
  final ShapeRepository _repository;

  const CreateCustomShape(this._repository);

  Future<Either<Failure, ShapeMission>> call(ShapeMission mission) =>
      _repository.createCustomMission(mission);
}

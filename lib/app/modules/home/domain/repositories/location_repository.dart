import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors.dart';
import '../entities/location_result.dart';

abstract class LocationRepository {
  Future<Either<Failure, LocationResult>> location();
}

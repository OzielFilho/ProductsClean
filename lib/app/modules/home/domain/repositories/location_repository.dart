import 'package:agence_teste/app/core/errors/errors.dart';
import 'package:agence_teste/app/modules/home/domain/entities/location_result.dart';
import 'package:dartz/dartz.dart';

abstract class LocationRepository {
  Future<Either<Failure, LocationResult>> location();
}

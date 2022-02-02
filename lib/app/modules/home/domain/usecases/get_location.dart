import '../../../../core/errors/errors.dart';
import '../entities/location_result.dart';
import '../repositories/location_repository.dart';
import 'package:dartz/dartz.dart';

abstract class GetLocation {
  Future<Either<Failure, LocationResult>> call();
}

class GetLocationImpl implements GetLocation {
  final LocationRepository repository;

  GetLocationImpl(this.repository);

  @override
  Future<Either<Failure, LocationResult>> call() async {
    return await repository.location();
  }
}

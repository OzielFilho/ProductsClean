import 'package:agence_teste/app/core/errors/errors.dart';

class GetListProductsError implements Failure {
  @override
  String? message;
  GetListProductsError({
    this.message,
  });
}

class GetLocationError implements Failure {
  @override
  String? message;
  GetLocationError({
    this.message,
  });
}

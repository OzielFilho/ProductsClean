import '../../../../core/errors/errors.dart';
import '../entities/result_products.dart';
import 'package:dartz/dartz.dart';

abstract class ProductsRepository {
  Future<Either<Failure, List<ResultProduct>>> listProduct();
}

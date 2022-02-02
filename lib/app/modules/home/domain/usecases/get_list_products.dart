import '../../../../core/errors/errors.dart';
import '../entities/result_products.dart';
import '../repositories/products_repository.dart';
import 'package:dartz/dartz.dart';

abstract class GetListProducts {
  Future<Either<Failure, List<ResultProduct>>> call();
}

class GetListProductsImpl implements GetListProducts {
  final ProductsRepository repository;

  GetListProductsImpl(this.repository);

  @override
  Future<Either<Failure, List<ResultProduct>>> call() async {
    return await repository.listProduct();
  }
}

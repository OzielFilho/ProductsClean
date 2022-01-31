import 'package:agence_teste/app/core/errors/errors.dart';
import 'package:agence_teste/app/modules/home/domain/entities/result_products.dart';
import 'package:agence_teste/app/modules/home/domain/repositories/products_repository.dart';
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

import 'package:agence_teste/app/modules/home/domain/entities/result_products.dart';
import 'package:agence_teste/app/core/errors/errors.dart';
import 'package:agence_teste/app/modules/home/domain/errors/errors.dart';
import 'package:agence_teste/app/modules/home/domain/repositories/products_repository.dart';
import 'package:agence_teste/app/modules/home/infrastructure/datasources/products_datasource.dart';
import 'package:dartz/dartz.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  final ProductsDatasource datasource;

  ProductsRepositoryImpl(this.datasource);
  @override
  Future<Either<Failure, List<ResultProduct>>> listProduct() async {
    try {
      final response = await datasource.getListProducts();
      if (response.isEmpty) {
        return Left(ResultEmpty(message: 'List Products empty'));
      }
      return Right(response);
    } catch (e) {
      return Left(GetListProductsError(message: 'Erro get list products'));
    }
  }
}

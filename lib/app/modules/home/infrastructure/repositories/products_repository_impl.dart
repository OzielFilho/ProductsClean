import '../../domain/entities/result_products.dart';
import '../../../../core/errors/errors.dart';
import '../../domain/errors/errors.dart';
import '../../domain/repositories/products_repository.dart';
import '../datasources/products_datasource.dart';
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

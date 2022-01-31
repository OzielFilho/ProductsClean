import 'package:agence_teste/app/core/errors/errors.dart';
import 'package:agence_teste/app/modules/home/domain/entities/result_products.dart';
import 'package:agence_teste/app/modules/home/domain/repositories/products_repository.dart';
import 'package:agence_teste/app/modules/home/domain/usecases/get_list_products.dart';
import 'package:dartz/dartz.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class ProductsRepositoryImpl extends Mock implements ProductsRepository {}

main() {
  ProductsRepository? repository;
  GetListProductsImpl? usecase;
  ResultProduct? resultProduct;

  setUp(() {
    repository = ProductsRepositoryImpl();
    usecase = GetListProductsImpl(repository!);
    resultProduct = ResultProduct(
        faker.internet.userName(), faker.image.image(), faker.lorem.sentence());
  });

  test('Should return an ResultProduct if success', () async {
    when(() => repository!.listProduct()).thenAnswer(
        (invocation) async => Right(<ResultProduct>[resultProduct!]));

    final result = await usecase!();

    expect(result.fold((l) => null, (r) => r), isA<List<ResultProduct>>());
  });
}

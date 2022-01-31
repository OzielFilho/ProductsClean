import 'package:agence_teste/app/core/errors/errors.dart';
import 'package:agence_teste/app/modules/home/domain/errors/errors.dart';
import 'package:agence_teste/app/modules/home/infrastructure/datasources/products_datasource.dart';
import 'package:agence_teste/app/modules/home/infrastructure/models/products_model.dart';
import 'package:agence_teste/app/modules/home/infrastructure/repositories/products_repository_impl.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class ProductsDatasourceImpl extends Mock implements ProductsDatasource {}

main() {
  ProductsDatasource? datasource;
  ProductsRepositoryImpl? repository;
  Products? resultProducts;

  setUp(() {
    datasource = ProductsDatasourceImpl();
    repository = ProductsRepositoryImpl(datasource!);
    resultProducts = Products(
        faker.internet.userName(), faker.image.image(), faker.lorem.sentence());
  });

  test('Should return an Products if sucess in listProduct', () async {
    when(() => datasource!.getListProducts())
        .thenAnswer((_) async => <Products>[resultProducts!]);

    final response = await repository!.listProduct();

    expect(response.fold((l) => null, (r) => r), isA<List<Products>>());
  });

  test('Should return an ResultEmpty if listProduct return []', () async {
    when(() => datasource!.getListProducts()).thenAnswer((_) async => []);

    final response = await repository!.listProduct();

    expect(response.fold((l) => l, (r) => []), isA<ResultEmpty>());
  });

  test('Should return an GetListProductsError if listProduct return error',
      () async {
    when(() => datasource!.getListProducts())
        .thenThrow((_) async => GetListProductsError());

    final response = await repository!.listProduct();

    expect(response.fold((l) => l, (r) => null), isA<GetListProductsError>());
  });
}

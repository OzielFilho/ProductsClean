import 'package:agence_teste/app/modules/home/infrastructure/models/products_model.dart';

abstract class ProductsDatasource {
  Future<List<Products>> getListProducts();
}

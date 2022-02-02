import '../models/products_model.dart';

abstract class ProductsDatasource {
  Future<List<Products>> getListProducts();
}

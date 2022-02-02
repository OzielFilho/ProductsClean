import '../../../core/errors/errors.dart';
import '../infrastructure/datasources/products_datasource.dart';
import '../infrastructure/models/products_model.dart';
import 'package:dartz/dartz.dart';

class GenerateFakerList implements ProductsDatasource {
  @override
  Future<List<Products>> getListProducts() async {
    List<Products>? result;

    try {
      result = List.generate(
          10,
          (index) => Products(
              'Phone 5s',
              'https://media.istockphoto.com/photos/woman-hand-holding-cellphone-with-empty-screen-on-white-background-picture-id1294325965?b=1&k=20&m=1294325965&s=170667a&w=0&h=rQWe3BR4tCNbhkuiR-zGa0tsFUv0OYd70Y_mZvIpV-w=',
              'description')).toList();
    } catch (e) {
      Left(Failure(message: 'Error in generate List'));
    }
    return result!;
  }
}

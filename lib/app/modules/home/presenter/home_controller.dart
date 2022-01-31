import 'package:agence_teste/app/modules/home/domain/usecases/get_list_products.dart';
import 'package:agence_teste/app/modules/home/infrastructure/models/products_model.dart';
import 'package:asuka/asuka.dart' as asuka;
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final GetListProducts listProducts;
  _HomeControllerBase(this.listProducts) {
    getListProducts();
  }

  @observable
  List<Products> products = [];

  @observable
  List<Products> productsTemp = [];

  @action
  getListProducts() async {
    final response = await listProducts();
    response.fold(
        (failure) =>
            asuka.showSnackBar(SnackBar(content: Text(failure.message!))),
        (result) {
      products = result as List<Products>;
      productsTemp = products.getRange(0, 5).toList();

      products.removeRange(0, 5);
    });
  }
}

import '../../../app_controller.dart';
import '../domain/usecases/get_list_products.dart';
import '../domain/usecases/get_location.dart';
import '../infrastructure/models/location_find_model.dart';
import '../infrastructure/models/products_model.dart';
import '../../login/infrastructure/models/user_result_logged.dart';
import 'package:asuka/asuka.dart' as asuka;
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final GetListProducts listProducts;
  final GetLocation location;
  _HomeControllerBase(this.listProducts, this.location) {
    getListProducts();
    getUser();
    getLocationUser();
  }
  @observable
  UserResultLogged? userResultLogged;
  @observable
  List<Products> products = [];

  @observable
  List<Products> productsTemp = [];

  @observable
  LocationFind? locationFind;

  @action
  getLocationUser() async {
    final response = await location();
    response.fold(
        (failure) =>
            asuka.showSnackBar(SnackBar(content: Text(failure.message!))),
        (result) => locationFind = result as LocationFind?);
  }

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

  @action
  getUser() async =>
      userResultLogged = await Modular.get<AppController>().getLoggedUser();
}

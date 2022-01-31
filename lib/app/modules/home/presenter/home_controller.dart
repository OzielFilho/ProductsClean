import 'package:agence_teste/app/modules/home/domain/usecases/get_list_products.dart';
import 'package:agence_teste/app/modules/home/infrastructure/models/products_model.dart';
import 'package:asuka/asuka.dart' as asuka;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final FirebaseFirestore firebaseFirestore;
  final GetListProducts listProducts;
  _HomeControllerBase(this.firebaseFirestore, this.listProducts) {
    getListProducts();
  }

  @observable
  List<Products> products = [];

  @action
  getListProducts() async {
    final response = await listProducts();
    response.fold(
        (failure) =>
            asuka.showSnackBar(SnackBar(content: Text(failure.message!))),
        (result) => products = result as List<Products>);
  }
}

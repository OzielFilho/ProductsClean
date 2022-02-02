// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$userResultLoggedAtom =
      Atom(name: '_HomeControllerBase.userResultLogged');

  @override
  UserResultLogged? get userResultLogged {
    _$userResultLoggedAtom.reportRead();
    return super.userResultLogged;
  }

  @override
  set userResultLogged(UserResultLogged? value) {
    _$userResultLoggedAtom.reportWrite(value, super.userResultLogged, () {
      super.userResultLogged = value;
    });
  }

  final _$productsAtom = Atom(name: '_HomeControllerBase.products');

  @override
  List<Products> get products {
    _$productsAtom.reportRead();
    return super.products;
  }

  @override
  set products(List<Products> value) {
    _$productsAtom.reportWrite(value, super.products, () {
      super.products = value;
    });
  }

  final _$productsTempAtom = Atom(name: '_HomeControllerBase.productsTemp');

  @override
  List<Products> get productsTemp {
    _$productsTempAtom.reportRead();
    return super.productsTemp;
  }

  @override
  set productsTemp(List<Products> value) {
    _$productsTempAtom.reportWrite(value, super.productsTemp, () {
      super.productsTemp = value;
    });
  }

  final _$locationFindAtom = Atom(name: '_HomeControllerBase.locationFind');

  @override
  LocationFind? get locationFind {
    _$locationFindAtom.reportRead();
    return super.locationFind;
  }

  @override
  set locationFind(LocationFind? value) {
    _$locationFindAtom.reportWrite(value, super.locationFind, () {
      super.locationFind = value;
    });
  }

  final _$getLocationUserAsyncAction =
      AsyncAction('_HomeControllerBase.getLocationUser');

  @override
  Future getLocationUser() {
    return _$getLocationUserAsyncAction.run(() => super.getLocationUser());
  }

  final _$getListProductsAsyncAction =
      AsyncAction('_HomeControllerBase.getListProducts');

  @override
  Future getListProducts() {
    return _$getListProductsAsyncAction.run(() => super.getListProducts());
  }

  final _$getUserAsyncAction = AsyncAction('_HomeControllerBase.getUser');

  @override
  Future getUser() {
    return _$getUserAsyncAction.run(() => super.getUser());
  }

  @override
  String toString() {
    return '''
userResultLogged: ${userResultLogged},
products: ${products},
productsTemp: ${productsTemp},
locationFind: ${locationFind}
    ''';
  }
}

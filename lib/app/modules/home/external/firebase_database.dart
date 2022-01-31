import 'package:agence_teste/app/core/errors/errors.dart';
import 'package:agence_teste/app/modules/home/infrastructure/datasources/products_datasource.dart';
import 'package:agence_teste/app/modules/home/infrastructure/models/products_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseDatabase implements ProductsDatasource {
  final FirebaseFirestore firebaseFirestore;

  FirebaseDatabase(
    this.firebaseFirestore,
  );

  @override
  Future<List<Products>> getListProducts() async {
    List<Products>? result;
    var ref = firebaseFirestore.collection('products').doc('items');
    try {
      DocumentSnapshot<Map<String, dynamic>> getList = await ref.get();
      List data = getList.data()!['data'];
      result = data.map((product) => Products.fromMap(product)).toList();
    } on FirebaseAuthException catch (e) {
      Left(Failure(message: e.message));
    }
    return result!;
  }
}

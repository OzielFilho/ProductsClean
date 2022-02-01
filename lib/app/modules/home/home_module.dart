import 'package:agence_teste/app/modules/home/domain/usecases/get_list_products.dart';
import 'package:agence_teste/app/modules/home/infrastructure/repositories/products_repository_impl.dart';
import 'package:agence_teste/app/modules/home/presenter/home_controller.dart';
import 'package:agence_teste/app/modules/home/presenter/home_page.dart';
import 'package:agence_teste/app/modules/home/presenter/pages/product_select/product_select_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'external/firebase_database.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => FirebaseFirestore.instance),
        Bind((i) => FirebaseDatabase(i())),
        Bind((i) => ProductsRepositoryImpl(i<FirebaseDatabase>())),
        Bind((i) => GetListProductsImpl(i())),
        Bind((i) => HomeController(
              i(),
            )),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute,
            child: (_, args) => const HomePage(),
            transition: TransitionType.leftToRightWithFade,
            duration: const Duration(milliseconds: 500)),
        ChildRoute('/select_product',
            child: (_, args) => ProductsSelectPage(
                  products: args.data,
                ),
            transition: TransitionType.size,
            duration: const Duration(milliseconds: 500)),
      ];
}

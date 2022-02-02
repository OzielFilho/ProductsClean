import 'home_controller.dart';
import 'widgets/card_product/card_product_widget.dart';
import 'widgets/drawer_custom/drawer_custom_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _getMoreProducts();
      }
    });
  }

  _getMoreProducts() {
    if (controller.products.isNotEmpty) {
      for (int i = 0; i < 5; i++) {
        setState(() {
          controller.productsTemp.add(controller.products[i]);
        });
      }
      setState(() {
        controller.products.removeRange(0, 5);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Scaffold(
          appBar: AppBar(
            title: const Text('List Products'),
            centerTitle: true,
          ),
          drawer: controller.userResultLogged != null
              ? DrawerCustom(
                  userResultLogged: controller.userResultLogged!,
                )
              : Container(),
          body: controller.productsTemp.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 220,
                            childAspectRatio: 0.7,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 15),
                    controller: _scrollController,
                    itemBuilder: (context, i) {
                      if (i == controller.productsTemp.length) {
                        return const CupertinoActivityIndicator();
                      }

                      return CardProductWidget(
                        products: controller.productsTemp[i],
                      );
                    },
                    itemCount: controller.productsTemp.length + 1,
                  ),
                )
              : const Center(
                  child: CupertinoActivityIndicator(
                  radius: 70,
                )));
    });
  }
}

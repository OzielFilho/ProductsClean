import 'package:asuka/asuka.dart' as asuka;
import 'package:flutter/material.dart';

import '../../../../../core/presenter/widgets/buttom_custom/buttom_custom.dart';
import '../../../../../core/presenter/widgets/confirme_dialog/confirme_dialog.dart';
import '../../../infrastructure/models/products_model.dart';
import '../../widgets/maps/maps_widget.dart';

class ProductsSelectPage extends StatelessWidget {
  final Products products;
  const ProductsSelectPage({Key? key, required this.products})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Select'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const MapsWidget(),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      image: DecorationImage(
                          image: NetworkImage(products.photo),
                          colorFilter: ColorFilter.mode(
                              Theme.of(context).cardColor.withOpacity(.1),
                              BlendMode.darken)),
                    )),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.65,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        products.name,
                        maxLines: 2,
                        style: Theme.of(context).textTheme.headline6,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        products.description,
                        maxLines: 2,
                        style: Theme.of(context).textTheme.subtitle1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 150,
          ),
          ButtomCustom(
              title: 'Buy Product',
              onTap: () {
                showDialog(
                    context: context,
                    barrierDismissible: true,
                    builder: (cont) => ShowDialogConfime(
                          content:
                              'Do you want to buy the product ${products.name}?',
                          title: 'Do you want to order?',
                          onClick: () {
                            Navigator.pop(cont);
                            Navigator.pop(context);
                            asuka.showSnackBar(const SnackBar(
                                content: Text('Purchase made successfully')));
                          },
                        ));
              }),
        ],
      ),
    );
  }
}

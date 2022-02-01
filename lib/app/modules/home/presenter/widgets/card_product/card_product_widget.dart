import 'package:agence_teste/app/core/presenter/widgets/buttom_custom/buttom_custom.dart';
import 'package:agence_teste/app/modules/home/infrastructure/models/products_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CardProductWidget extends StatelessWidget {
  final Products products;
  const CardProductWidget({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          children: [
            Container(
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                    image: NetworkImage(products.photo), fit: BoxFit.fill),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              products.name,
              maxLines: 1,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline3,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              products.description,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: 10,
            ),
            ButtomCustom(
                title: 'Buy',
                onTap: () {
                  Modular.to.pushNamed('select_product', arguments: products);
                }),
          ],
        ),
      ),
    );
  }
}

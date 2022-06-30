import 'dart:collection';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:greggs_app/model/item.dart';
import 'package:greggs_app/providers/basket_provider.dart';
import 'package:greggs_app/widgets/custom_app_bar.dart';
import 'package:provider/provider.dart';

class BasketScreen extends StatelessWidget {
  const BasketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Consumer<BasketProvider>(
        builder: (context, basketProvider, child) {
          HashSet<Item> itemCategory = HashSet();
          for (Item basketItem in basketProvider.basket) {
            itemCategory.add(basketItem);
          }
          return ListView.builder(
            itemCount: itemCategory.length,
            itemBuilder: (BuildContext context, int index) {
              double totalCategoryPrice = 0;
              int totalItems = 0;

              for (Item basketItem in basketProvider.basket) {
                if (itemCategory.elementAt(index) == basketItem) {
                  totalCategoryPrice +=
                      itemCategory.elementAt(index).eatOutPrice;
                  totalItems++;
                }
              }
              return Card(
                child: ListTile(
                  leading: CachedNetworkImage(
                    imageUrl: itemCategory.elementAt(index).thumbnailUri,
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                  title: Text(itemCategory.elementAt(index).articleName),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                          '£ ${itemCategory.elementAt(index).eatOutPrice} X $totalItems  = '),
                      Text(
                        ' £ ${totalCategoryPrice.toStringAsFixed(2)}',
                      ),
                    ],
                  ),
                  onLongPress: () {
                    Provider.of<BasketProvider>(context, listen: false)
                        .deleteItemFromBasket(itemCategory.elementAt(index));
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}

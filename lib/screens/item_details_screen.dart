import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:greggs_app/model/item.dart';
import 'package:greggs_app/providers/basket_provider.dart';
import 'package:greggs_app/screens/home_screen.dart';
import 'package:greggs_app/widgets/custom_app_bar.dart';
import 'package:provider/provider.dart';

class ItemDetailsScreen extends StatelessWidget {
  final Item item;
  const ItemDetailsScreen({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: ListView(
            children: [
              CachedNetworkImage(
                imageUrl: item.imageUri,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    item.articleName,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.black,
                    child: Consumer<BasketProvider>(
                        builder: (context, basketProvider, child) {
                      int itemsInBucket = 0;

                      for (Item basketItem in basketProvider.basket) {
                        if (basketItem.articleCode == item.articleCode) {
                          itemsInBucket++;
                        }
                      }

                      return Text(itemsInBucket.toString());
                    }),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Provider.of<BasketProvider>(context, listen: false)
                          .addItemtoBasket(item);
                    },
                    icon: const Icon(Icons.add_shopping_cart),
                    label: const Text('Buy'),
                  )
                ],
              ),
              const Divider(),
              Container(
                height: 100,
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Eat in    £${item.eatInPrice.toString()}',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Text(
                      'Eat out £${item.eatOutPrice.toString()}',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                ),
              ),
              Text(
                item.customerDescription,
                style: Theme.of(context).textTheme.bodyText1,
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

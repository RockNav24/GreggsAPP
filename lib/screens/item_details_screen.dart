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
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    item.articleName,
                    style: Theme.of(context).textTheme.headline6,
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

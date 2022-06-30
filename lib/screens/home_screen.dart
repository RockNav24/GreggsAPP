import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:greggs_app/model/item.dart';
import 'package:greggs_app/screens/item_details_screen.dart';
import 'package:greggs_app/utils.dart';
import 'package:greggs_app/widgets/basketIcon.dart';
import 'package:greggs_app/widgets/custom_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(),
        body: SafeArea(
          child: FutureBuilder<List<Item>?>(
              future: readJson(),
              builder: (context, itemsSnapshot) {
                if (itemsSnapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (itemsSnapshot.hasError) {
                  return const Center(
                    child: Text('Error when loading data.'),
                  );
                }
                if (itemsSnapshot.hasData) {
                  return ListView.builder(
                      itemCount: itemsSnapshot.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          child: ListTile(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ItemDetailsScreen(
                                  item: itemsSnapshot.data![index],
                                ),
                              ),
                            ),
                            leading: CachedNetworkImage(
                              imageUrl: itemsSnapshot.data![index].thumbnailUri,
                              placeholder: (context, url) =>
                                  const CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                            title: Text(itemsSnapshot.data![index].articleName),
                            trailing: Text(
                              '£ ${itemsSnapshot.data![index].eatOutPrice.toString()}',
                            ),
                          ),
                        );
                      });
                } else {
                  return const Center(
                    child: Text('No data found.'),
                  );
                }
              }),
        ));
  }
}

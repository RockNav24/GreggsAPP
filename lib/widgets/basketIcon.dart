import 'package:flutter/material.dart';
import 'package:greggs_app/providers/basket_provider.dart';
import 'package:provider/provider.dart';

class BasketIcon extends StatelessWidget {
  final VoidCallback onTap;
  const BasketIcon({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Stack(
          alignment: Alignment.center,
          children: [
            const Icon(
              Icons.shopping_cart_outlined,
              size: 40,
              color: Colors.white,
              semanticLabel: 'Basket',
            ),
            if (Provider.of<BasketProvider>(context).basket.isNotEmpty)
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      Provider.of<BasketProvider>(context)
                          .getItemCount()
                          .toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

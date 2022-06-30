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
      child: Stack(
        children: [
          const Icon(Icons.shopping_bag),
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: Text(
                  Provider.of<BasketProvider>(context)
                      .getItemCount()
                      .toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

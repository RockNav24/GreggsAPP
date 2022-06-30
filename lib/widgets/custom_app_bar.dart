import 'package:flutter/material.dart';
import 'package:greggs_app/widgets/basketIcon.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Greggs'),
      actions: const [
        BasketIcon(),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

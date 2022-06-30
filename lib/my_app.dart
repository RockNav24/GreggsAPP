import 'package:flutter/material.dart';
import 'package:greggs_app/screens/basket_screen.dart';
import 'package:greggs_app/screens/home_screen.dart';
import 'package:greggs_app/providers/basket_provider.dart';
import 'package:provider/provider.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BasketProvider>(
          create: (_) => BasketProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          'home': (context) => const HomeScreen(),
          'basket': (context) => const BasketScreen(),
        },
        initialRoute: 'home',
      ),
    );
  }
}

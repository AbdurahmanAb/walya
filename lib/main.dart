import 'package:flutter/material.dart';
import 'package:waliya/pick_up.dart';
import 'package:provider/provider.dart';
import 'package:waliya/provider/country_provider.dart';
import 'package:waliya/provider/date_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CountryProvder(),
        ),
        ChangeNotifierProvider(
          create: (context) => DateProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: pickupPage(),
    );
  }
}

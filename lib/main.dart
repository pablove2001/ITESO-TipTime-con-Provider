import 'package:calandoprov/providers/tip_time_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'views/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
        ),
      ),
      home: ChangeNotifierProvider(
        create: (context) => TipTimeProvider(),
        child: HomePage(),
      ),
    );
  }
}

import 'package:bizlers/provider/profile_provider.dart';
import 'package:bizlers/provider/sqlitedb.dart';
import 'package:bizlers/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ApiProvider>(
          create: (_) => ApiProvider(),
        ),
        ChangeNotifierProvider<DatabaseHelper>(
          create: (_) => DatabaseHelper(),
        )
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}

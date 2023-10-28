import 'package:aya_s_final_project/presentation/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Contacts',
      theme: ThemeData(
          primarySwatch: Colors.indigo, primaryColor: Colors.indigoAccent),
      home: const MyHomePage(),
    );
  }
}

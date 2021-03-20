import 'package:desafio_flutter1/views/home.dart';
import 'package:desafio_flutter1/views/revenda_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(
              builder: (context) => Home(),
            );
            break;
          case '/revenda':
            return MaterialPageRoute(
              builder: (context) => RevendaPage(
                revenda: settings.arguments,
              ),
            );
            break;
        }
      },
    );
  }
}

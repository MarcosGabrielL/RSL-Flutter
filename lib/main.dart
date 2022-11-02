import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'pages/splash_screen.dart';

void main() {
  runApp( RedeSocialLivre());
}

class RedeSocialLivre extends StatelessWidget {


  Color _primaryColor = HexColor('#4c20b1');
  Color _accentColor = HexColor('#a199c2');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rede Social Livre',
      theme: ThemeData(
        primaryColor: _primaryColor,
        accentColor: _accentColor,
        scaffoldBackgroundColor: Colors.grey.shade100,
        primarySwatch: Colors.grey,
      ),
      home: SplashScreen(title: 'Rede Social Livre'),
    );
  }
}


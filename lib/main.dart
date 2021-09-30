import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Screen/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();//NOVAS VERSÕES DO CORE TEM QUE INICIALIZAR O FIREBASE
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Plano de Fundo NFT',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen()
    );
  }
}


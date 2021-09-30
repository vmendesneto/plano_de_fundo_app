import 'package:flutter/material.dart';
import 'package:plano_de_fundo_app/Tabs/home_tab.dart';
import 'package:plano_de_fundo_app/Widgets/drawer_images.dart';


class HomeScreen extends StatelessWidget {


  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: NeverScrollableScrollPhysics(),//nao deixa mudar de tela arrastando
      controller: _pageController,
      children: <Widget>[
        Scaffold( //entrou na pag Inicial
          body: HomeTab(),
          drawer: DrawerImages(_pageController),
        ),
      ],
    );

  }
}


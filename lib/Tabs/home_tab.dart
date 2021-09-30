import 'package:flutter/material.dart';


class HomeTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Widget _buildBodyBack() =>
        Container( //criando tela degrade
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 0, 0, 139),
                    //o 255 é padrão, o RGB é o depois(0,0,139)
                    Color.fromARGB(255, 0, 0, 255)
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight
              )
          ),
        );
    return Stack(
      children: [
        _buildBodyBack(),
        CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              //ficar flutuante
              snap: true,
              //voltar ao subir um pouco
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text("Plano de Fundo NFT"),
                centerTitle: true,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
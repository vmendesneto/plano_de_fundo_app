
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:transparent_image/transparent_image.dart';

class FotosTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget _buildBodyBack() => Container(
          //criando tela degrade
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 211, 118, 138),
            Color.fromARGB(255, 253, 181, 168)
          ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        );
    return Stack(//Stack é para que fique acima da tela de fundo
        children: [
      //Para que a barra de cima fique flutuante
      _buildBodyBack(),
      CustomScrollView(
        slivers: [
          SliverAppBar(
            actions: [
              IconButton(
                  icon: Icon(Icons.chat_bubble_outlined), onPressed: () {
              })
            ],
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text("Fotos"),
              //para que ele saiba que é constante e otimiza o codigo
              centerTitle: true,
            ),
          ),
          FutureBuilder<QuerySnapshot>(
            future: FirebaseFirestore.instance.collection('imagens').get(),
            //future: Firestore.instance.collection("imagens").getDocuments(),
            //buscando as imagens e oredenando pelo posicao
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) //NÃO ESQUECA A EXCLAMAÇÃO
                return SliverToBoxAdapter(
                  //nao pode colocar um circle pq esta em um Sliver por isso adapta um Sliver
                  child: Container(
                    height: 200,
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  ),
                );
              else
                return SliverStaggeredGrid.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 1.0,
                  crossAxisSpacing: 1.0,
                  staggeredTiles: snapshot.data.docs.map((doc) {
                    return StaggeredTile.count(1, 1);
                  } //tamanho da foto
                      ).toList(),
                  children: snapshot.data.docs.map((doc) {
                    return FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: doc.data().toString().contains('foto') ? doc.get('foto') : '',
                      fit: BoxFit.cover,
                    );
                  }).toList(),
                );
            },
          ),
        ],
      )
    ]);
  }
}

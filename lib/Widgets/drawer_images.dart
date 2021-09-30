import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plano_de_fundo_app/Screen/home_screen.dart';
import 'package:plano_de_fundo_app/Screen/images_screen.dart';


import '../main.dart';



class DrawerImages extends StatelessWidget {

  final PageController pageController8;
  File arquivo;
  final picker = ImagePicker();
  Future getFilefromGallery() async{
    final file = await picker.getImage(source: ImageSource.gallery);
    if(file != null){
      arquivo = File(file.path);
    }
  }
  DrawerImages(this.pageController8);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: [
          Scaffold(
            body: ListView(
              padding: EdgeInsets.only(left: 2.0, top: 16.0),
              children: <Widget>[
                Column(
                    children: [ Container(
                        margin: EdgeInsets.only(bottom: 2.0),
                        padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
                        height: 80,
                        child: Stack(  //STACK PQ SE VOCE ESCOLHE A POSIÇÃO E PODE COLOCAR ALGUMA COISA NO SUPERIOR DIREITO NA COLUN NAO PODE
                          children: [
                            Positioned(
                              top: 8.0,
                              left: 0.0,
                              child: Text("Plano de Fundo NFT",  //para quebrar linha
                                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
                            ),
                          ],
                        )
                    ),
                      Container(
                        height: 60.0,
                        alignment: Alignment.center,
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: Text("Usuario", style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),),
                        ),
                      ),
                      Divider(),
                      ListTile(
                        leading: Icon(Icons.playlist_add_check),
                        title: Text("Imagens"),
                        trailing: Icon(Icons.arrow_forward),
                        onTap:() {
                          Navigator.of(context).pop();
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) => FotosTab()));//está navegando para a nova rota, nesse caso de teste navego para a primeira
                        },
                      ),
                    ]
                ),
              ],
            ),
            bottomSheet: Container(
              alignment: Alignment.center,
              height: 20.0,
              child: RaisedButton(
                onPressed: (){ Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
                },
                child: Text("Voltar", style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),),
              ),
            ),
          ),
        ],
      ),
    );
  }

}

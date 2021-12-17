// ignore_for_file: prefer_const_constructors, file_names

import 'package:aula03/Anima%C3%A7%C3%A3o%20controlada/animacaoBtn_controlada.dart';
import 'package:aula03/Anima%C3%A7%C3%A3o%20controlada/expasiontole.dart';
import 'package:aula03/Anima%C3%A7%C3%A3o%20implicita/ExpasionTile_implicita.dart';
import 'package:aula03/Anima%C3%A7%C3%A3o%20implicita/animacaobtn_inplicita.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Animations'),
      ),
      body: Column(
        children: [
          ListTile(
            title: Text('1 Animação mudança de botão implicita'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AnimatedInpBtn()));
            },
          ),
          ListTile(
            title: Text('2 Animçao drop down implicita'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ExpasionTileImplicita(),
                ),
              );
            },
          ),
          ListTile(
            title: Text('3 Animação mudança de botão controlada'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AnimatedControlBtn(),
                ),
              );
            },
          ),
          ListTile(
            title: Text('4 Animção dropDown'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ExpansionTileControlada(),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

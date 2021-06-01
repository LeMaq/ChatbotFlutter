// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:chatbot/AboutScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart' as mainScreen;

void sobre() => runApp(MyApp());

class Sobre extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Welcome to Flutter',
        home: Scaffold(
          backgroundColor: Color.fromARGB(255, 168, 210, 210),
          appBar: AppBar(
            leading: IconButton (
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                mainScreen.main();
              },
            ),
            backgroundColor: Colors.lightBlueAccent,
            title: Image.asset('Assets\\logo2.png', width: 200, height:  100, ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(alignment: Alignment.center,),
              SizedBox(height: 70),
              Image.asset('Assets\\logo1.png',  width : 150 , height: 200),
              SizedBox(height: 50),
              Text(
                "Sobre o projeto!",
                style : TextStyle (fontSize: 60, color: Color.fromARGB(
                    255, 28, 121, 121)),
              ),
              SizedBox(height: 50),

              Text(
                "Thera.py é um aplicativo mobilepara conversas terapêutica pormeio de uma InteligênciaArtificial (IA). O chatbot interagecom o usuário além de lheoferecer dicas para ajudar emmomentos de stress, ansiedadee nervosismo.",
                style : TextStyle (fontSize: 30, color: Color.fromARGB(
                    255, 28, 121, 121)),
              ),
            ],
          ),
        )
    );
  }
}

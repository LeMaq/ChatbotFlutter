// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:chatbot/AboutScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'GotoChat.dart' as Chat;

void main() => runApp(MyApp());

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 168, 210, 210),
        appBar: AppBar(
          backgroundColor: Colors.lightBlueAccent,
          title: Image.asset('Assets\\logo2.png', width: 200, height:  100, ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(alignment: Alignment.center,),
              SizedBox(height: 70),
              Image.asset('Assets\\logo1.png',  width : 350 , height: 400),
              SizedBox(height: 50),
              ElevatedButton (
                  child: Text('Consulte-se com a nossa terapeuta',),
                style: ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
                  onPressed: () {
                    Chat.GoToChat();
                  },
              ),
              SizedBox(height: 50),
              ElevatedButton (
                child: Text('Saiba um pouco mais sobre o projeto!',),
                style: ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10)),
                onPressed: () {
                  Chat.GoToChat();
                },
              ),
                  ],
                  ),
                  )
                );
  }
}

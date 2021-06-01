import 'package:chatbot/home_screen.dart' as home;
import 'package:flutter/material.dart';

void GoToChat() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      debugShowCheckedModeBanner:  false,
      title : "Thera.py",
      home : home.HomeScreen(),
    );
  }

}
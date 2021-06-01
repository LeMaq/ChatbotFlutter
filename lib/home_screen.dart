import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:chatbot/main.dart' as mainScreen;


class HomeScreen extends StatefulWidget
{
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final GlobalKey<AnimatedListState> _listKey = GlobalKey();
  List<String> _data = [];

  static const BOT_URL = "https://elisachatbot-app.herokuapp.com/bot/oi";
  TextEditingController queryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 162, 205, 205),
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        centerTitle: true,
        leading: IconButton (
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            mainScreen.main();
          },
        ),
        title: Image.asset('Assets\\logo2.png', width: 200, height:  100, ),
      ),
      body: Stack(
        children: <Widget>[
          AnimatedList(
            key: _listKey,
            initialItemCount: _data.length,
            itemBuilder:
                (BuildContext context, int index, Animation<double> animation) {
              return buildItem(_data[index], animation, index);
            },
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: ColorFiltered(
                colorFilter: ColorFilter.linearToSrgbGamma(),
                child: Container(
                  color: Colors.white,
                  child: Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: TextField(
                          decoration: InputDecoration(
                            icon: Icon(
                              Icons.airline_seat_recline_extra,
                              color: Colors.blue,
                            ),
                            hintText: "Como você está se sentindo?",
                            fillColor: Colors.white12,
                          ),
                          controller: queryController,
                          textInputAction: TextInputAction.send,
                          onSubmitted: (msg) {
                            this.getResponse();
                          }
                      )
                  ),
                ),
              )
          )

        ],
      ),
    );
  }

  void getResponse() {
    if (queryController.text.length > 0) {
      this.insertSingleItem(queryController.text);
      var client = getClient();
      try{
        debugPrint("Entered try");
        client.post(
          Uri.parse(BOT_URL),
          body: {"query": queryController.text},
        ).. then((response)
        {
          debugPrint("Entered then");
          print(response.body);
          Map<String, dynamic> data = jsonDecode(response.body);
          insertSingleItem(data['response'] + "<bot>");
        });
      } finally {
        client.close();
        debugPrint("Entered finally");
        queryController.clear();
      }
    }
  }

  void insertSingleItem(String message) {
    _data.add(message);
    _listKey.currentState!.insertItem(_data.length - 1);
  }

  http.Client  getClient() {
        return http.Client();
  }

}

  Widget buildItem(String item, Animation<double> animation, int index) {
      bool mine = item.endsWith("<bot>");
      return SizeTransition(
        sizeFactor  : animation,
        child: Padding(
            padding: EdgeInsets.only(top: 15, left: 10, right : 10  ),
            child: Container(
              alignment: mine ? Alignment.topLeft  : Alignment.topRight,
              child: Bubble(
                  child: Text(
                    item.replaceAll("<bot>", ""),
                    style: TextStyle(
                        color: mine ? Colors.white: Colors.black),
                  ),
                  color: mine ? Colors.blue : Colors.grey[200],
                  padding: BubbleEdges.all(10)
              ),
            )
        ),
      );
    }


import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:http/http.dart' as http;
import 'package:flash_chat/model/game_data.dart';

class ChatScreen extends StatefulWidget {
  static const String id = 'chat_screen';
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class MyHttpOverrides extends HttpOverrides{
  @override


  HttpClient createHttpClient(SecurityContext context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}

class _ChatScreenState extends State<ChatScreen> {
  final _auth = FirebaseAuth.instance;
  User loggedInUser;

  int currentPage = 1;

  List<Tournament> gamer = [];

  Future<bool> getTournamentData()async{
    final Uri uri = Uri.parse("http://tournaments-dot-game-tv-prod.uc.r.appspot.com/tournament/api/tournaments_list_v2?limit=10&status=all");

    final response = await http.get(uri);

    if(response.statusCode == 200){
      ///
      final result = welcomeFromJson(response.body);

      gamer = result.data.tournaments;
      currentPage++;

      print(response.body);
      print(gamer);
      setState(() {
      });
      return true;
    }else{
      return false;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentuser();
    getTournamentData();


  }
  void getCurrentuser() async{
    try{
    final user = await _auth.currentUser;
    if(user != null){
      loggedInUser = user;
      print(loggedInUser.email);
    }}
    catch (e){
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                //Implement logout functionality
                _auth.signOut();
                Navigator.pop(context);
              }),
        ],
        title: Center(child: Text('⚡️Flyingwolf')),
        backgroundColor: Colors.blueGrey,
      ),
      body:Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left:30.0,top: 50),
                child: CircleAvatar(
                  radius: 40.0,
                  backgroundImage: AssetImage('images/simon.jpg'),
                ),
              ),
              Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 50.0,right: 20),
                    child: Text(
                      'Simon Baker',
                      textAlign: TextAlign.right,

                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  new Container(
                    height: 40.0,
                    width: 150.0,
                    color: Colors.transparent,
                    margin: EdgeInsets.only(left:10.0,top: 20.0),
                    child: new Container(
                      decoration: new BoxDecoration(
                          border: Border.all(color: Colors.blueAccent),

                          borderRadius: new BorderRadius.only(
                            topLeft: const Radius.circular(20.0),
                            topRight: const Radius.circular(20.0),
                            bottomRight: const Radius.circular(20.0),
                            bottomLeft: const Radius.circular(20.0),

                          )
                      ),
                      child: Row(
                        children:<Widget> [
                          new Container(
                            margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: new Text(
                              "2250",
                              style: TextStyle(
                                fontSize: 22.0,
                                color: Colors.blueAccent,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Text(
                              'Elo rating',
                              style: TextStyle(
                                fontSize: 12.0,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                        ],

                      ),
                    ),
                  ),
                ],

              ),
            ],

          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                height: 95.0,
                width: 100.0,
                color: Colors.transparent,
                alignment: Alignment.center,
                child: new Container(
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  padding: EdgeInsets.all(10),
                  decoration: new BoxDecoration(
                      color: Colors.orangeAccent,
                      borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(15.0),
                        bottomLeft: const Radius.circular(15.0),
                      )
                  ),

                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Text(
                          '34',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 17.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),

                        ),
                      ),
                      Container(
                        child: Text(
                          'Tournaments Played',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 13.0,
                            color: Colors.white,
                          ),

                        ),
                      ),
                    ],

                  ),

                ),
              ),
              new Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                height: 95.0,
                width: 100.0,
                color: Colors.transparent,
                alignment: Alignment.center,
                child: new Container(
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  padding: EdgeInsets.all(10),
                  decoration: new BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(0),
                        bottomLeft: const Radius.circular(0),
                      )
                  ),

                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Text(
                          '09',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 17.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),

                        ),
                      ),
                      Container(
                        child: Text(
                          'Tournaments Won',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 13.0,
                            color: Colors.white,
                          ),

                        ),
                      ),
                    ],

                  ),


                ),
              ),
              new Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                height: 95.0,
                width: 100.0,
                color: Colors.transparent,
                alignment: Alignment.center,
                child: new Container(
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  padding: EdgeInsets.all(10),
                  decoration: new BoxDecoration(
                      color: Colors.pinkAccent,
                      borderRadius: new BorderRadius.only(
                        topRight: const Radius.circular(15.0),
                        bottomRight: const Radius.circular(15.0),
                      )
                  ),

                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Text(
                          '26%',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 17.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),

                        ),
                      ),
                      Container(
                        child: Text(
                          'Winning Percentage',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 13.0,
                            color: Colors.white,
                          ),

                        ),
                      ),
                    ],

                  ),


                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(top: 20.0,right: 100),
            child: Text(
              'Recommended for you',
              textAlign: TextAlign.right,

              style: TextStyle(
                fontSize: 20.0,
                color: Colors.black54,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          new Container(
            padding: EdgeInsets.only(top: 20.0),
            height: 170.0,
            width: 300.0,
            color: Colors.transparent,
            child: new Container(
              decoration: new BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: new BorderRadius.only(
                    topLeft: const Radius.circular(40.0),
                    topRight: const Radius.circular(40.0),
                    bottomLeft: const Radius.circular(40.0),
                    bottomRight: const Radius.circular(40.0),
                  )
              ),

            ),

          ),
          new Container(
            padding: EdgeInsets.only(top: 20.0),
            height: 170.0,
            width: 300.0,
            color: Colors.transparent,
            child: new Container(
              decoration: new BoxDecoration(
                  color: Colors.greenAccent,
                  borderRadius: new BorderRadius.only(
                    topLeft: const Radius.circular(40.0),
                    topRight: const Radius.circular(40.0),
                    bottomLeft: const Radius.circular(40.0),
                    bottomRight: const Radius.circular(40.0),
                  )
              ),

            ),
          ),





        ],
      ),



    );
  }
}

/**/

/*Container(

child: ListView.separated(
itemBuilder: (context, index){
final gamers = gamer[index];

return ListTile(
title: Text(gamers.name),
subtitle: Text(gamers.gameName),
trailing: Text(gamers.adminUsername),
);
},
separatorBuilder: (context, index) => Divider(),
itemCount: gamer.length),
),*/
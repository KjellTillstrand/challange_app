// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Player challange App',
        theme: ThemeData(
          primaryColor: Colors.red,
      ),
      home: PlayerChallange(),
    );
  }
}


class PlayerChallange extends StatefulWidget {
  @override
  PlayerState createState() => PlayerState();
}

class PlayerState extends State<PlayerChallange> {

  final _players = Players().players;
  final _biggerFont = const TextStyle(fontSize: 18.0);

  //
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('XXX Challange app'),
      ),
      body: _buildSuggestions(),
    );
  }

  // Select list build rows
  Widget _buildSuggestions() {
    return ListView.separated(
        itemCount: _players.length,
        separatorBuilder: (BuildContext context, int index) => Divider(),
        itemBuilder: (BuildContext context, int index) {
          return _buildRow(_players[index]);}
        );
  }


  Widget _matchPane(Player player){
    return Scaffold(
      appBar: AppBar(
        title: Text("Match details against " + player.name ),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back! ' ),
        ),
      ),
    );

  }

  // Select list players row details
  Widget _buildRow(Player player) {
    void _pushSaved() {
      Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (BuildContext context) {
            return _matchPane(player);
          },
        ),
      );
    }


    return ListTile(
      title: Text(
        player.name + "(" + player.fargoRate.toString() + ")",
        style: _biggerFont,
      ),
      onTap: _pushSaved ,
    );
  }
}


// Player class
class Player {
  
  String _name ;
  String _id ;
  int _fargoRate;

  Player(this._name, this._id, this._fargoRate);

  int get fargoRate => _fargoRate;
  String get id => _id;
  String get name => _name;
}


// Example datastruct that should be fetched externally
class Players {
  List<Player> _players = [
    new Player("Adam", "abd1", 551),
    new Player("Bertil", "abd2", 552),
    new Player("Cesar", "abd3", 553),
    new Player("David", "abd4", 554),
    new Player("Erik", "abd5", 555),
    new Player("Fredrik", "abd6", 556),
    new Player("Gustav", "abd7", 557),
    new Player("Harald", "abd8", 558),
    new Player("Ivar", "abd9", 559),
  ];

  List<Player> get players => _players;
}

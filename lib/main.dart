import 'package:dragonballz/screen2.dart';
import 'package:dragonballz/screen3.dart';
import 'package:flutter/material.dart';

final redShadeColor = Colors.red.shade500;
final greyShade = Colors.grey.shade800;
final textColor = Colors.white70;

void main() => runApp(MaterialApp
(
  debugShowCheckedModeBanner: false,
  
      home: Dragonballz(),
      theme: ThemeData.dark()
          .copyWith(appBarTheme: AppBarTheme().copyWith(color: redShadeColor)),
    ));

class Dragonballz extends StatefulWidget {
  @override
  _DragonballzState createState() => _DragonballzState();
}

class _DragonballzState extends State<Dragonballz> {
  String gokuLabel = 'Goku';
  String vegetaLabel = 'Vegeta';
  String winner = '';
  String selectedPlayer = '';
  int gokuScore = 300;
  int vegetaScore = 550;

  void calculateWinner() {
    setState(() {
      this.winner =
          this.gokuScore < this.vegetaScore ? vegetaLabel : gokuLabel;
    });
  }

  void playerSelected(String player) {
    setState(() {
      this.selectedPlayer = player == gokuLabel ? gokuLabel : vegetaLabel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        title: Text('Dragonballz '),

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          calculateWinner();
        },
        backgroundColor: redShadeColor,
        child: Image.asset(
          'images/fight.png',
          height: 40.0,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              PlayerProfile(
                  avatar: 'images/g.png',
                  playerName: gokuLabel,
                  playerScore: gokuScore,
                  playerSelected: playerSelected,
                  selected: this.selectedPlayer == gokuLabel ? true : false),
              Container(
                height: 200,
                child: VerticalDivider(
                  thickness: 3.0,
                  width: 20,
                  color: redShadeColor,
                ),
              ),
              PlayerProfile(
                  avatar: 'images/v.png',
                  playerName: vegetaLabel,
                  playerScore: vegetaScore,
                  playerSelected: playerSelected,
                  selected: this.selectedPlayer == vegetaLabel ? true : false),
            ],
          ),
          Visibility(
            visible: this.winner != '',
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      if (winner == gokuLabel) {
                        return Screen2();
                      } else if (winner == vegetaLabel) {
                        return Screen3();
                      }
                      return null;
                    },
                  ),
                );
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
                width: double.infinity,
                height: 70,
                decoration: BoxDecoration(
                  color: greyShade,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    '$winner Wins!',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                        color: textColor),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          FlatButton(
            onPressed: () {
              if (this.selectedPlayer == gokuLabel) {
                setState(() {
                  this.gokuScore += 100;
                });
              } else if (this.selectedPlayer == vegetaLabel) {
                setState(() {
                  this.vegetaScore += 100;
                });
              }
            },
            child: Image.asset(
              'images/boost.png',
              width: 100,
              height: 100,
              color: redShadeColor,
            ),
          ),
        ],
      ),
    );
  }
}

class PlayerProfile extends StatelessWidget {
  final String avatar, playerName;
  final int playerScore;
  final bool selected;
  final Function playerSelected;
  PlayerProfile(
      {this.avatar,
      this.playerName,
      this.playerScore,
      this.playerSelected,
      this.selected});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        this.playerSelected(this.playerName);
      },
      child: Container(
          width: 170,
          height: 280,
          decoration: BoxDecoration(
            color: selected == true ? redShadeColor : greyShade,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                backgroundImage: AssetImage(
                  avatar,
                ),
                radius: 50,
                backgroundColor: textColor,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                playerName,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                    color: textColor),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                playerScore.toString(),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 50.0,
                    color: textColor),
              ),
              Text(
                'Points',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                    color: textColor),
              ),
            ],
          )),
    );
  }
}

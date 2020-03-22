import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Goku Wins!'),
      ),
      backgroundColor: Colors.grey.shade900,
      body: Center(
        child: Image.asset('images/goku.gif'),
      ),
    );
  }
}

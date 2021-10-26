import 'dart:math';

import 'package:dice_roller/roll_bloc.dart';
import 'package:dice_roller/roll_event.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dice Roller',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Dice Roller'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _bloc = RollerBloc();

  int timesRolled = 0;

  // int dicevalue = Random().nextInt(6) + 1;

  int dicecount = 0;

  // void rollDice() {
  //   setState(() {
  //     dicevalue = Random().nextInt(6) + 1;

  //     if (timesRolled <= 9) {
  //       timesRolled += 1;
  //       dicecount += dicevalue;
  //     } else {
  //       timesRolled = 0;
  //       dicecount = 0;
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: StreamBuilder(
          stream: _bloc.rolledno,
          initialData: Random().nextInt(6) + 1,
          builder: (context, snapshot) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('$timesRolled'),
                  Text('$dicecount'),
                  Expanded(
                    child: Image.asset('assets/dice-${snapshot.data}.png'),
                  ),
                  ElevatedButton(
                    onPressed: () => _bloc.rollerEventSink.add(Rolled()),
                    child: Text('Roll'),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
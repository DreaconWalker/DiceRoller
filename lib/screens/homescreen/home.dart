import 'dart:math';

import 'package:dice_roller/apptheme.dart';
import 'package:dice_roller/roll_bloc.dart';
import 'package:dice_roller/roll_event.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  final _bloc = RollerBloc();

<<<<<<< HEAD
=======
  @override
  void initState() {
    super.initState();
    customTheme.addListener(() {
      setState(() {});
    });
  }
>>>>>>> 807403c6d64fd4b9fafbaa1fdbf48c2c8c85f112

  @override
  void dispose() {
    super.dispose();
    _bloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_4),
            onPressed: () => customTheme.toggleTheme(),
          )
        ],
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StreamBuilder<int>(
                stream: _bloc.timesRolled,
                initialData: 0,
                builder: (context, snapshot) {
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text('Times Rolled: ${snapshot.data}'),
                  );
                }),
            StreamBuilder<int>(
                stream: _bloc.totalDiceCount,
                initialData: 0,
                builder: (context, snapshot) {
                  return Text('Rolling total: ${snapshot.data}');
                }),
            StreamBuilder<int>(
                stream: _bloc.rolledno,
                initialData: Random().nextInt(6) + 1,
                builder: (context, snapshot) {
                  return Expanded(
                    child: Image.asset('assets/dice-${snapshot.data}.png'),
                  );
                }),
            ElevatedButton(
              onPressed: () => _bloc.rollerEventSink.add(Rolled()),
              child: Text('Roll'),
            ),
          ],
        ),
      ),
    );
  }
}

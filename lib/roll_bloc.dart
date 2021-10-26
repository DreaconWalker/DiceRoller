import 'dart:async';
import 'dart:math';

import 'package:dice_roller/roll_event.dart';

class RollerBloc {
  
  int _timesRolled = 0;
  int _diceValue = Random().nextInt(6) + 1;
  int _totalDiceCount = 0;

  final _rollerStateController = StreamController<int>();

  StreamSink<int> get _rolledDice => _rollerStateController.sink;

  Stream<int> get rolledno => _rollerStateController.stream;

  final _rollerEventController = StreamController<RollerEvent>();

  Sink<RollerEvent> get rollerEventSink => _rollerEventController.sink;

  RollerBloc() {
    _rollerEventController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(RollerEvent event) {
    if (event is Rolled) {
    
    } else {


    }
  }
}

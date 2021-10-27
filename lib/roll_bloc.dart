import 'dart:async';
import 'dart:math';

import 'package:dice_roller/roll_event.dart';

class RollerBloc {
  int _timesRolled = 0;
  int _diceValue = Random().nextInt(6) + 1;
  int _totalDiceCount = 0;

  //logic for rolling dice
  final _rollerStateController = StreamController<int>();

  StreamSink<int> get _rolledDice => _rollerStateController.sink;

  Stream<int> get rolledno => _rollerStateController.stream;

  final _rollerEventController = StreamController<RollerEvent>();

  Sink<RollerEvent> get rollerEventSink => _rollerEventController.sink;

  //logic to count number of times rolled
  final _timesRolledStateController = StreamController<int>();
  Stream<int> get timesRolled => _timesRolledStateController.stream;
  StreamSink<int> get _noOfTimesRolled => _timesRolledStateController.sink;
  // final _timesEventController = StreamController<TenRolled>();
  // Sink<TenRolled> get tenRolledEventSink => _timesEventController.sink;

  final _totalDiceCountController = StreamController<int>();
  Stream<int> get totalDiceCount => _totalDiceCountController.stream;
  StreamSink<int> get _diceCount => _totalDiceCountController.sink;

  RollerBloc() {
    _rollerEventController.stream.listen(_mapEventToState);
    // _timesEventController.stream.listen(_mapEventToState);
    // _timesRolledEventController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(RollerEvent event) {
    if (event is Rolled) {
      _diceValue = Random().nextInt(6) + 1;
      if (_timesRolled <= 9) {
        _timesRolled += 1;
        _totalDiceCount += _diceValue;
      } else {
        _timesRolled = 0;
        _totalDiceCount = 0;
      }
    } else {}

    _rolledDice.add(_diceValue);
    _noOfTimesRolled.add(_timesRolled);
    _diceCount.add(_totalDiceCount);
  }

  void dispose() {
    _rollerStateController.close();
    _rollerEventController.close();
    _timesRolledStateController.close();
    _totalDiceCountController.close();
  }
}

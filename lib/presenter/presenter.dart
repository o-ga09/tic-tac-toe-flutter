import 'package:tic_tac_toe_fluttrer/domain/entity.dart';

import '../state/state.dart';
import '../usecase/port/OutputPort.dart';

class GamePresenter implements OutPutPort {
  final GameState state;
  
  GamePresenter(this.state);
  @override
  void display(Board board) {
    state.setBoard(board);
  }
}
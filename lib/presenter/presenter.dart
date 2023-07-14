import 'package:tic_tac_toe_fluttrer/domain/entity.dart';

import '../state/state.dart';
import '../usecase/port/OutputPort.dart';

class GamePresenter implements OutPutPort {
  final GameState state;
  
  GamePresenter(this.state);

  @override
  bool input(int turn,int x,int y) {
    final koma = Koma(turn, x, y);
    return state.setBoard(koma);
  }

  @override
  void reset() {
    state.resetBoard();
  }
}
import 'package:tic_tac_toe_fluttrer/usecase/port/OutputPort.dart';
import '../domain/entity.dart';


class GameUsecase {
  OutPutPort gameOutPutPort;
  GameUsecase(this.gameOutPutPort);
  
  InputData input(int turn, int index) {
    final inputdata = posConvert(index, turn);
    final res = gameOutPutPort.input(turn, inputdata.x,inputdata.y);

    return InputData(turn, inputdata.x, inputdata.y, res);
  }

  bool isWin(List<List<int>> board,InputData pos) {
    if(checkVertical(board,pos) || checkHorizon(board,pos) || checkCross(board,pos)) {
      return true;
    }
    return false;
  }

  void reset() {
    gameOutPutPort.reset();
  }

  bool checkVertical(List<List<int>> board,InputData pos){
    for(var i = 0; i < 3; i++) {
      if(board[i][0] == board[i][1] && board[i][1] == board[i][2] && board[i][0] == board[i][2] && board[i][0] == pos.order) {
        return true;
      }
    }
    return false;
  }

  bool checkHorizon(List<List<int>> board,InputData pos) {
      for(var i = 0; i < 3; i++) {
      if(board[0][i] == board[1][i] && board[1][i] == board[2][i] && board[0][i] == board[2][i] && board[0][i] == pos.order) {
        return true;
      }
    }
    return false;
  }

  bool checkCross(List<List<int>> board,InputData pos) {
      if(board[0][0] == board[1][1] && board[1][1] == board[2][2] && board[0][0] == board[2][2] && board[0][0] == pos.order) {
        return true;
      } else if(board[0][2] == board[1][1] && board[1][1] == board[2][0] && board[0][2] == board[2][0] && board[0][2] == pos.order) {
        return true;
      }

    return false;
  }

  bool isEmpty(List<List<int>> board) {
    for(var i = 0; i < 3; i++) {
      for(var j = 0; j < 3; j++) {
        if(board[i][j] == -1){
          return true;
        }
      }
    }

    return false;
  }

  Koma posConvert(int index,int turn) {
    final int x;
    final int y;
    if(index >= 0 && index <= 2){
      x = 0;
      y = index;
    } else if(index >= 3 && index <= 5) {
      x = 1;
      y = index - 3;
    } else if(index >= 6 && index <= 8) {
      x = 2;
      y = index - 6;
    } else {
      x = -1;
      y = -1;
    }
    final koma = Koma(turn, x, y);
    return koma;
  }
}

class InputData {
  final int order;
  final int x;
  final int y;
  final bool putted;

  InputData(this.order, this.x, this.y,this.putted);
}
import 'package:flutter/material.dart';
import 'package:tic_tac_toe_fluttrer/domain/entity.dart';

class GameState extends ChangeNotifier {
  List<List<int>> board = List.generate(3, (_) => List.filled(3, -1));
  List<Color> boardcolor = List.filled(9, Colors.white);

  bool setBoard(Koma koma) {
    var index = posConvert(koma.x, koma.y);

    if(board[koma.x][koma.y] != -1) {
      notifyListeners();
      return false;
    }
    board[koma.x][koma.y] = koma.order;
    
    if(koma.order == 0 ) {
      boardcolor[index] = Colors.red;
    } else {
      boardcolor[index] = Colors.blue;
    }
    notifyListeners();
    return true;
  }

  resetBoard() {
    board = List.generate(3, (_) => List.filled(3, -1));
    boardcolor = List.filled(9, Colors.white);
    notifyListeners();
  }

  int posConvert(int x,int y) {
    if(x == 0){
      return y;
    } else if(x == 1) {
      return y + 3;
    } else if(x == 2) {
      return y + 6;
    } else {
      return -1;
    }
  }
}
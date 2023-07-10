import 'package:flutter/material.dart';

class GameDriver {
  final DriverBoard board = {} as DriverBoard;


  GameDriver() {
    for(var i = 0; i < 3; i++) {
      for(var j = 0; j < 3; j++) {
        board.board[i][j] = -1;
      }
    }

    for(var i = 0; i < 9; i++) {
      board.boardcolor[i] = Colors.white;
    }
  }

  DriverBoard input(DriverKoma koma) {
    final index = posConvert(koma.x, koma.y);
    board.board[koma.x][koma.y] = koma.order;
    // 色をプレイヤーの色に変更する
    // 先攻：赤、後攻：青
    if (koma.order == 0) {
      board.boardcolor[index] = Colors.red;
    } else {
      board.boardcolor[index] = Colors.blue;
    }
    return board;
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

class DriverKoma {
  final int order;
  final int x;
  final int y;

  DriverKoma(this.order, this.x, this.y);
}

class DriverBoard {
  final List<List<int>> board;
  final List<Color> boardcolor;

  DriverBoard(this.board,this.boardcolor);
}
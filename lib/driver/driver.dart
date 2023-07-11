import 'package:flutter/material.dart';

class GameDriver {
  late List<List<int>> board;
  late List<Color> boardcolor;

  GameDriver() {
    board = List.generate(3, (_) => List.filled(3, -1));
    boardcolor = List.filled(9, Colors.white);
  }

  DriverBoard input(DriverKoma koma) {
    final index = posConvert(koma.x, koma.y);
    if(board[koma.x][koma.y] != -1) {
      return DriverBoard(board, boardcolor);
    }
    board[koma.x][koma.y] = koma.order;
    // 色をプレイヤーの色に変更する
    // 先攻：赤、後攻：青
    if (koma.order == 0) {
      boardcolor[index] = Colors.red;
    } else {
      boardcolor[index] = Colors.blue;
    }
    return DriverBoard(board, boardcolor);
  }

  DriverBoard reset() {
    var b = List.generate(3, (_) => List.filled(3, -1));
    var bc = List.filled(9, Colors.white);
    var initBoard = DriverBoard(board, boardcolor);

    board = b;
    boardcolor = bc;

    return initBoard;
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
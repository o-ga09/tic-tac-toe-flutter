import 'package:flutter/material.dart';
import 'package:tic_tac_toe_fluttrer/domain/entity.dart';

class GameState {
  List<List<int>> board = List.generate(3, (_) => List.filled(3, -1));
  List<Color> boardcolor = List.filled(9, Colors.white);

  setBoard(Board b) {
    board = b.board;
    boardcolor = b.boardcolor;
  }

  GameUnit convertGameUnit(List<List<int>> board , List<Color> boardcolor) {
    return GameUnit(
      board,
      boardcolor
    );
  }
}

class GameUnit {
  final List<List<int>> board; 
  final List<Color> boardcolor;
  GameUnit(this.board, this.boardcolor);
}
import 'package:flutter/material.dart';
import 'package:tic_tac_toe_fluttrer/domain/entity.dart';

class GameState {
  GameUnit board = [] as GameUnit;

  setBoard(Board b) {
    board = convertGameUnit(b.board,b.boardcolor);
  }

  GameUnit convertGameUnit(List<List<int>> board , List<Color> boardcolor) {
    return GameUnit(
      board,
      boardcolor
    );
  }
}

class GameUnit {
  GameUnit(
    final List<List<int>> board, 
    final List<Color> boardcolor
  );
}
import 'package:flutter/material.dart';

class Board {
  final List<List<int>> board;
  final List<Color> boardcolor;

  Board(this.board, this.boardcolor);
}

class Koma {
  final int order;
  final int x;
  final int y;

  Koma(this.order, this.x, this.y);
}
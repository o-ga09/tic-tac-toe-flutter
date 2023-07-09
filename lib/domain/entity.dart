class Board {
  List<List<int>> board;

  Board() : board = [];

  List<List<int>> init() {
    for(var i = 0; i < 3; i++) {
      for(var j = 0; j < 3; j++) {
        board[i][j] = -1;
      }
    }

    return board;
  }
}

class Koma {
  final int order;
  final int x;
  final int y;

  Koma(this.order, this.x, this.y);
}
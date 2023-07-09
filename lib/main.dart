import 'package:flutter/material.dart';
import 'package:tic_tac_toe_fluttrer/domain/entity.dart';

void main() {
  // runApp(MyApp());
  runApp(MaterialApp(
    title: 'test',
    home: MyHomePage(),
  ));
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int turn = 0;
  List<Color> board_color = [ Colors.white, Colors.white, Colors.white,
                              Colors.white, Colors.white, Colors.white,
                              Colors.white, Colors.white, Colors.white,
                            ];
  List<List<int>> board = [
                            [-1,-1,-1],
                            [-1,-1,-1],
                            [-1,-1,-1],
                          ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Tic Tac Toe'),
        ),
        body: Center(
          child: Column(
            children: [
              Container(
                width: 300,
                height: 50,
                color: turn == 0 ? Colors.red : Colors.blue,
                margin: const EdgeInsets.fromLTRB(0.0, 100.0, 0.0, 50.0),
                child: const Text(
                  'ターン',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(
                width: 300,
                height: 300,
                child: GridView.count(
                  crossAxisCount: 3,
                  children: List.generate(9, (index) {
                    return GestureDetector(
                      onTap: () {
                        // 入力座標をドメインの型に変換
                        final koma = posConvert(index, turn);

                        // タップした場所が空白か
                        if(board[koma.x][koma.y] != -1) {
                          showDialog(
                            context: context, 
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('置けません'),
                                content: const Text('その場所にはすでに駒が置かれています'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('OK'),
                                  )
                                ]
                              );
                            },
                          );
                          return;
                        }
          
                        // 色をプレイヤーの色に変更する
                        // 先攻：赤、後攻：青
                        if (turn == 0) {
                          board_color[index] = Colors.red;
                        } else {
                          board_color[index] = Colors.blue;
                        }

                        // 盤面を更新
                        board[koma.x][koma.y] = turn;
                        turn = 1 - turn;
                        
                        // 引き分け判定
                        if(!isEmpty(board)) {
                          showDialog(
                            context: context, 
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('ゲーム終了'),
                                content: const Text('引き分けです！'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('OK'),
                                  )
                                ]
                              );
                            },
                          );
                          board_color = [ Colors.white, Colors.white, Colors.white,
                                          Colors.white, Colors.white, Colors.white,
                                          Colors.white, Colors.white, Colors.white,
                                        ];
                          board = [
                                    [-1,-1,-1],
                                    [-1,-1,-1],
                                    [-1,-1,-1],
                                  ];
                          turn = 0;

                          // 状態を更新
                          setState(() {});
                        }

                        // 状態を更新
                        setState(() {});

                        // 終了判定をする
                        if(isWin(board, koma)){
                          showDialog(
                            context: context, 
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('ゲーム終了'),
                                content: Text('勝者は${koma.order == 0 ? '赤' : '青'}です！'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('OK'),
                                  )
                                ]
                              );
                            },
                          );
                          board_color = [ Colors.white, Colors.white, Colors.white,
                                          Colors.white, Colors.white, Colors.white,
                                          Colors.white, Colors.white, Colors.white,
                                        ];
                          board = [
                                    [-1,-1,-1],
                                    [-1,-1,-1],
                                    [-1,-1,-1],
                                  ];
                          turn = 0;

                          // 状態を更新
                          setState(() {});
                        }


                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          color: board_color[index]
                        ),
                      ),
                    );
                  }),
                ),
              ), 
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // 盤面を初期化する
            board_color = [ Colors.white, Colors.white, Colors.white,
                            Colors.white, Colors.white, Colors.white,
                            Colors.white, Colors.white, Colors.white,
                          ];
            board = [
                      [-1,-1,-1],
                      [-1,-1,-1],
                      [-1,-1,-1],
                    ];
            turn = 0;

            // 状態を更新
            setState(() {});
          },
          child: const Icon(Icons.refresh),
        ),
      ),
    );
  }
}

Koma posConvert(int index,int turn) {
  final int x;
  final int y;
  if(index >= 0 && index <= 2){
    x = index;
    y = 0;
  } else if(index >= 3 && index <= 5) {
    x = index - 3;
    y = 1;
  } else if(index >= 6 && index <= 8) {
    x = index - 6;
    y = 2;
  } else {
    x = -1;
    y = -1;
  }
  final koma = Koma(turn, x, y);
  return koma;
}

bool isWin(List<List<int>> board,Koma pos) {
  if(checkVertical(board,pos) || checkHorizon(board,pos) || checkCross(board,pos)) {
    return true;
  }
  return false;
}

bool checkVertical(List<List<int>> board,Koma pos){
  for(var i = 0; i < 3; i++) {
    if(board[i][0] == board[i][1] && board[i][1] == board[i][2] && board[i][0] == board[i][2] && board[i][0] == pos.order) {
      return true;
    }
  }
  return false;
}

bool checkHorizon(List<List<int>> board,Koma pos) {
    for(var i = 0; i < 3; i++) {
    if(board[0][i] == board[1][i] && board[1][i] == board[2][i] && board[0][i] == board[2][i] && board[0][i] == pos.order) {
      return true;
    }
  }
  return false;
}

bool checkCross(List<List<int>> board,Koma pos) {
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
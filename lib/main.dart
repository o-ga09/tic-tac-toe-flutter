import 'package:flutter/material.dart';
import 'package:tic_tac_toe_fluttrer/driver/driver.dart';
import 'package:tic_tac_toe_fluttrer/gateway/gateway.dart';
import 'package:tic_tac_toe_fluttrer/presenter/presenter.dart';
import 'package:tic_tac_toe_fluttrer/state/state.dart';
import 'package:tic_tac_toe_fluttrer/usecase/usecase.dart';

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
  static var gameState = GameState();
  static var driver = GameDriver();
  static var gateway = GameGateway(driver);
  static var presenter = GamePresenter(gameState);
  static var usecase = GameUsecase(presenter,gateway);

  int turn = 1;

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
                        final koma = usecase.input(turn, index);

                        // タップした場所が空白か
                        if(koma.order == -2) {
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
          


                        // 盤面を更新
                        turn = 1 - turn;
                        
                        // 引き分け判定
                        if(!usecase.isEmpty(gameState.board)) {
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
                          usecase.reset();
                          turn = 0;

                          // 状態を更新
                          setState(() {});
                        }

                        // 状態を更新
                        setState(() {});

                        // 終了判定をする
                        if(usecase.isWin(gameState.board, koma)){
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
                          usecase.reset();
                          turn = 0;

                          // 状態を更新
                          setState(() {});
                        }


                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          color: gameState.boardcolor[index]
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
            usecase.reset();
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
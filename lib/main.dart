import 'package:flutter/material.dart';
import 'package:tic_tac_toe_fluttrer/presenter/presenter.dart';
import 'package:tic_tac_toe_fluttrer/state/state.dart';
import 'package:tic_tac_toe_fluttrer/usecase/usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  // runApp(MyApp());
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

final gameStateProvider = ChangeNotifierProvider((ref) {
  return GameState();
});

// ignore: must_be_immutable
class MyHomePage extends ConsumerWidget {
  MyHomePage({Key?  key}) : super(key: key);

  int turn = 0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final board = ref.watch(gameStateProvider);
    final presenter = GamePresenter(board);
    final usecase = GameUsecase(presenter);

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
                        if(!koma.putted) {
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

                        // 引き分け判定
                        if(!usecase.isEmpty(board.board)) {
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
                        }

                        // 終了判定をする
                        if(usecase.isWin(board.board, koma)){
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
                          // usecase.reset();
                          turn = 0;
                        }
                        // プレイヤー交代
                        turn = 1 - turn;
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          color: board.boardcolor[index]
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
          },
          child: const Icon(Icons.refresh),
        ),
      ),
    );
  }
}
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tic_tac_toe_fluttrer/presenter/presenter.dart';
import 'package:tic_tac_toe_fluttrer/state/state.dart';
import 'presenter_test.mocks.dart';



@GenerateNiceMocks([MockSpec<GameState>()])
void main() {
  group('ゲートウェイのテスト', () {
    test('盤面に駒を置く', () {
      final mock = MockGameState();
      when(mock.setBoard(any)).thenReturn(true);

      final presenter = GamePresenter(mock);
      final res = presenter.input(1, 1, 1);

      verify(mock.setBoard(any)).called(1);
      expect(res, true);
    });

    test('盤面をリセットする', () {
      final mock = MockGameState();
      when(mock.resetBoard());

      final presenter = GamePresenter(mock);
      presenter.reset();

      verify(mock.resetBoard()).called(1);
    });
  });
}
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tic_tac_toe_fluttrer/presenter/presenter.dart';
import 'package:tic_tac_toe_fluttrer/usecase/usecase.dart';
import 'usecase_test.mocks.dart';

@GenerateNiceMocks([MockSpec<GamePresenter>()])
void main() {
  group('ユーズケースのテスト', () {
    test('盤面に駒を置く', () {
      final mock = MockGamePresenter();
      when(mock.input(1,1,2)).thenReturn(true);

      final usecase = GameUsecase(mock);
      final res = usecase.input(1, 5);

      verify(mock.input(1,1,2)).called(1);
      expect(res.order,1);
      expect(res.x,1);
      expect(res.y,2);
      expect(res.putted,true);
    });

    test('盤面をリセットする', () {
      final mock = MockGamePresenter();
      when(mock.reset());

      final usecase = GameUsecase(mock);
      usecase.reset();

      verify(mock.reset()).called(1);
 
    });
  });
}
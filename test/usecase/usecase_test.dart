import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tic_tac_toe_fluttrer/domain/entity.dart';
import 'package:tic_tac_toe_fluttrer/usecase/usecase.dart';

import 'mock.dart';

void main() {
  group('ユーズケースのテスト', () {
    test('盤面に駒を置く', () {
      var mock = UsecaseMock();
      var koma = Koma(1, 1, 1);
      when(mock.input(koma));

      var usecase = GameUsecase(mock);
      var actual = usecase.input(1, 1);
      expect(actual.putted, true);
    });
  });
}
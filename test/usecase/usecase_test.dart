import 'package:flutter_test/flutter_test.dart';
import 'package:tic_tac_toe_fluttrer/usecase/usecase.dart';

void main() {
  group('ユーズケースのテスト', () {
    test('座標を入力する', () {
      final usecase = InputUsecase();
      final actual = usecase.input();
      expect(actual.order, 0);
      expect(actual.x, 0);
      expect(actual.y, 0);  
    });
  });
}
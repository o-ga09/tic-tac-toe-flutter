import 'package:tic_tac_toe_fluttrer/domain/entity.dart';

abstract class OutPutPort {
  bool input(Koma koma);
  void reset();
}
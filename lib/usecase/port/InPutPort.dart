import 'package:tic_tac_toe_fluttrer/domain/entity.dart';

abstract class InPutPort {
  Board input(Koma koma);
  Board reset();
}
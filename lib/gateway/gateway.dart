import 'package:tic_tac_toe_fluttrer/domain/entity.dart';

import '../driver/driver.dart';
import '../usecase/port/InPutPort.dart';

class GameGateway implements InPutPort {
  final GameDriver gameDriver;
  GameGateway(this.gameDriver);
  
  @override
  Board input(Koma koma) {
    final driverKoma = DriverKoma(koma.order,koma.x,koma.y);
    final res = gameDriver.input(driverKoma);
    return Board(res.board,res.boardcolor);
  }
}
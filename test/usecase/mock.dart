import 'package:mockito/mockito.dart';
import 'package:tic_tac_toe_fluttrer/domain/entity.dart';
import 'package:tic_tac_toe_fluttrer/usecase/port/OutputPort.dart';

class UsecaseMock extends Mock implements OutPutPort {

  @override
  bool input(Koma koma) {
    return true;
  }
}
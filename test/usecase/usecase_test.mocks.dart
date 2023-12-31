// Mocks generated by Mockito 5.4.2 from annotations
// in tic_tac_toe_fluttrer/test/usecase/usecase_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:mockito/mockito.dart' as _i1;
import 'package:tic_tac_toe_fluttrer/presenter/presenter.dart' as _i3;
import 'package:tic_tac_toe_fluttrer/state/state.dart' as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeGameState_0 extends _i1.SmartFake implements _i2.GameState {
  _FakeGameState_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [GamePresenter].
///
/// See the documentation for Mockito's code generation for more information.
class MockGamePresenter extends _i1.Mock implements _i3.GamePresenter {
  @override
  _i2.GameState get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: _FakeGameState_0(
          this,
          Invocation.getter(#state),
        ),
        returnValueForMissingStub: _FakeGameState_0(
          this,
          Invocation.getter(#state),
        ),
      ) as _i2.GameState);
  @override
  bool input(
    int? turn,
    int? x,
    int? y,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #input,
          [
            turn,
            x,
            y,
          ],
        ),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  void reset() => super.noSuchMethod(
        Invocation.method(
          #reset,
          [],
        ),
        returnValueForMissingStub: null,
      );
}

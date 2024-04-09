// Mocks generated by Mockito 5.4.4 from annotations
// in status/test/mocks.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;
import 'dart:ui' as _i5;

import 'package:flutter/widgets.dart' as _i1;
import 'package:mockito/mockito.dart' as _i2;
import 'package:status/core/dialog/dialog_handler.dart' as _i3;
import 'package:status/core/navigation/navigation_bus.dart' as _i6;
import 'package:status/core/navigation/navigation_intent.dart' as _i7;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeGlobalKey_0<T extends _i1.State<_i1.StatefulWidget>>
    extends _i2.SmartFake implements _i1.GlobalKey<T> {
  _FakeGlobalKey_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [DialogHandler].
///
/// See the documentation for Mockito's code generation for more information.
class MockDialogHandler extends _i2.Mock implements _i3.DialogHandler {
  @override
  _i1.GlobalKey<_i1.State<_i1.StatefulWidget>> get dialogKey =>
      (super.noSuchMethod(
        Invocation.getter(#dialogKey),
        returnValue: _FakeGlobalKey_0<_i1.State<_i1.StatefulWidget>>(
          this,
          Invocation.getter(#dialogKey),
        ),
        returnValueForMissingStub:
            _FakeGlobalKey_0<_i1.State<_i1.StatefulWidget>>(
          this,
          Invocation.getter(#dialogKey),
        ),
      ) as _i1.GlobalKey<_i1.State<_i1.StatefulWidget>>);

  @override
  _i4.Future<Object?> showDialog(
    String? routeName, {
    Duration? duration = const Duration(seconds: 3),
    bool? autoDismiss = false,
    Object? arguments,
    bool? opaque = true,
    _i5.Color? barrierColor,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #showDialog,
          [routeName],
          {
            #duration: duration,
            #autoDismiss: autoDismiss,
            #arguments: arguments,
            #opaque: opaque,
            #barrierColor: barrierColor,
          },
        ),
        returnValue: _i4.Future<Object?>.value(),
        returnValueForMissingStub: _i4.Future<Object?>.value(),
      ) as _i4.Future<Object?>);

  @override
  void dismissDialog([Object? result]) => super.noSuchMethod(
        Invocation.method(
          #dismissDialog,
          [result],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [NavigationBus].
///
/// See the documentation for Mockito's code generation for more information.
class MockNavigationBus extends _i2.Mock implements _i6.NavigationBus {
  @override
  _i4.Stream<_i7.NavigationIntent> get stream => (super.noSuchMethod(
        Invocation.getter(#stream),
        returnValue: _i4.Stream<_i7.NavigationIntent>.empty(),
        returnValueForMissingStub: _i4.Stream<_i7.NavigationIntent>.empty(),
      ) as _i4.Stream<_i7.NavigationIntent>);

  @override
  void emit(_i7.NavigationIntent? intent) => super.noSuchMethod(
        Invocation.method(
          #emit,
          [intent],
        ),
        returnValueForMissingStub: null,
      );
}

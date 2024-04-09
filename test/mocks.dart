import 'package:mockito/annotations.dart';
import 'package:status/core/dialog/dialog_handler.dart';
import 'package:status/core/navigation/navigation_bus.dart';

@GenerateNiceMocks([
    MockSpec<DialogHandler>(),
    MockSpec<NavigationBus>(),
    ])
void main() {}
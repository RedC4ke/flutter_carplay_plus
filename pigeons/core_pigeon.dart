import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(PigeonOptions(
  dartOut: 'lib/src/platform_interface/core/core_messages.g.dart',
  dartOptions: DartOptions(),
  swiftOut: 'ios/Classes/PlatformInterface/CoreMessages.g.swift',
  swiftOptions: SwiftOptions(),
  dartPackageName: 'flutter_carplay_plus',
))
@HostApi()
abstract class CoreHostApi {}

@FlutterApi()
abstract class CoreFlutterApi {
  void onConnectionStatusChanged(
    CarplayConnectionStatus status,
  );
}

//* Models
class CarplayConnectionStatusMessage {
  final CarplayConnectionStatus status;

  CarplayConnectionStatusMessage({required this.status});
}

//* Enums
enum CarplayConnectionStatus {
  connected,
  background,
  disconnected,
  unknown,
}

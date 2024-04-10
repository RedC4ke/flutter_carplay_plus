import 'package:flutter_carplay_plus/src/platform_interface/core/core_messages.g.dart';
import 'package:rxdart/subjects.dart';

/// Provides an implementation of the [CoreFlutterApi] interface.
/// Receives messages from the platform side and sends them to the appropriate
/// listeners.
class CoreFlutterClient implements CoreFlutterApi {
  /// Creates a new [CoreFlutterClient].
  CoreFlutterClient() {
    CoreFlutterApi.setup(this);
  }

  final BehaviorSubject<CarplayConnectionStatus> _connectionStatusSubject =
      BehaviorSubject<CarplayConnectionStatus>.seeded(
    CarplayConnectionStatus.unknown,
  );

  /// A stream of [CarplayConnectionStatus] events.
  Stream<CarplayConnectionStatus> get connectionStatusStream =>
      _connectionStatusSubject.stream;

  @override
  void onConnectionStatusChanged(CarplayConnectionStatus status) {
    _connectionStatusSubject.add(status);
  }
}

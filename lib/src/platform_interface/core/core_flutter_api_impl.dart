import 'package:flutter_carplay_plus/src/platform_interface/core/core_messages.g.dart';
import 'package:rxdart/subjects.dart';

class CoreFlutterApiImpl implements CoreFlutterApi {
  final BehaviorSubject<CarplayConnectionStatus> _connectionStatusSubject =
      BehaviorSubject<CarplayConnectionStatus>.seeded(
    CarplayConnectionStatus.unknown,
  );
  Stream<CarplayConnectionStatus> get connectionStatusStream =>
      _connectionStatusSubject.stream;

  @override
  void onConnectionStatusChanged(CarplayConnectionStatus status) {
    _connectionStatusSubject.add(status);
  }
}

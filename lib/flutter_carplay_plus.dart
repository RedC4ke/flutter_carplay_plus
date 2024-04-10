import 'package:flutter_carplay_plus/src/platform_interface/core/core_flutter_client.dart';

export 'src/platform_interface/core/core_messages.g.dart'
    show CarplayConnectionStatus;

/// A Flutter plugin for CarPlay.
abstract class FlutterCarplayPlus {
  static final CoreFlutterClient coreFlutterClient = CoreFlutterClient();
}

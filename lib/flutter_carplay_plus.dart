import 'package:flutter_carplay_plus/src/platform_interface/core/core_api.dart';
import 'package:flutter_carplay_plus/ui/fcp_router.dart';

export 'src/platform_interface/core/core_messages.g.dart'
    show CarplayConnectionStatus;

/// A Flutter plugin for CarPlay.
class FlutterCarplayPlus {
  FlutterCarplayPlus() {
    FCPRouter.initialize();
  }

  static final CoreApi coreApi = CoreApi();
  static const router = FCPRouter;
}

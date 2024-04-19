import 'package:flutter_carplay_plus/src/platform_interface/template/template_messages.g.dart';

class TemplateApi extends TemplateHostApi implements TemplateFlutterApi {
  void Function(String objectId)? _interactionHandler;

  /// Sets the handler to use when a component is interacted with.
  void setInteractionHandler(void Function(String objectId) handler) {
    _interactionHandler = handler;
  }

  @override
  void interactionStarted(String objectId) {
    _interactionHandler?.call(objectId);
  }

  @override
  void onTabSelected(String tabBarTemplateId, String selectedTemplateId) {
    // TODO(Redc4ke): implement onTabSelected
  }
}

import 'package:flutter_carplay_plus/src/platform_interface/template/template_api.dart';
import 'package:flutter_carplay_plus/ui/models/fcp_component.dart';
import 'package:flutter_carplay_plus/ui/models/templates/fcp_template.dart';

/// This class is used to manage the navigation stack.
abstract class FCPRouter {
  // TODO(Redc4ke): Implement action result callbacks for more reliability.
  static List<FCPTemplate> _templateStack = const [];
  static final TemplateApi _templateApi = TemplateApi();

  /// Initializes the router.
  static void initialize() {
    _templateApi.setInteractionHandler(_handleInteraction);
  }

  static Future<void> _handleInteraction(String objectId) async {
    /// Ensures that if the caller does not invoke the completer, the interaction
    /// is still marked as completed.
    var hasCompleterRan = false;

    final component = await _templateStack.findByUuid(objectId);
    if (component != null && component is FCPInteractiveComponent) {
      component.onPressed?.call(
        component,
        () {
          hasCompleterRan = true;
          if (!hasCompleterRan) _templateApi.interactionCompleted(objectId);
        },
      );
    }

    if (!hasCompleterRan) {
      await _templateApi.interactionCompleted(objectId);
    }
  }

  /// Clears the current template stack and pushes the given template as root.
  static Future<void> pushRootTemplate(
    FCPRootTemplate template, {
    bool animated = true,
  }) async {
    final result = _templateApi.pushTemplate(
      wrappedTemplateData: template.serializedData,
      animated: animated,
      asRoot: true,
    );

    _templateStack = [template];

    return result;
  }

  /// Pushes the given template to the top of the stack.
  static Future<void> pushTemplate(
    FCPTemplate template, {
    bool animated = true,
  }) async {
    final result = _templateApi.pushTemplate(
      wrappedTemplateData: template.serializedData,
      animated: animated,
    );

    _templateStack.add(template);

    return result;
  }

  /// Pops the top template from the stack.
  static Future<void> popTemplate({
    bool animated = true,
  }) async {
    final result = await _templateApi.popTemplate(animated: animated);

    if (_templateStack.isNotEmpty) {
      _templateStack.removeLast();
    }

    return result;
  }

  /// Pops all templates from the stack except the root template.
  static Future<void> popToRootTemplate({
    bool animated = true,
  }) async {
    final result = await _templateApi.popToRootTemplate(animated: animated);

    if (_templateStack.isNotEmpty) {
      _templateStack = [_templateStack.first];
    }

    return result;
  }
}

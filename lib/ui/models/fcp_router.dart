import 'package:flutter_carplay_plus/src/platform_interface/template/template_messages.g.dart';
import 'package:flutter_carplay_plus/ui/models/templates/fcp_template.dart';

/// This class is used to manage the navigation stack.
abstract class FCPRouter {
  final TemplateHostApi _templateHostApi = TemplateHostApi();

  /// Clears the current template stack and pushes the given template as root.
  Future<void> pushRootTemplate(FCPRootTemplate template) async {
    return _templateHostApi.pushTemplate(
      wrappedTemplateData: template.serializedData,
      asRoot: true,
    );
  }
}

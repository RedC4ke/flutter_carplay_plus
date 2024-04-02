import 'package:flutter_carplay_plus/src/platform_interface/template/template_messages.g.dart';
import 'package:flutter_carplay_plus/ui/models/templates/fcp_list_template.dart';
import 'package:flutter_carplay_plus/ui/models/templates/fcp_template.dart';

/// A representation of Apple's [CPTabBarTemplate](https://developer.apple.com/documentation/carplay/cptabbartemplate).
/// A root template for displaying [FCPListTemplate]s, each with their own tab.
final class FCPTabBarTemplate extends FCPNavigableTemplate
    implements FCPRootTemplate {
  /// Creates a new instance of [FCPTabBarTemplate].
  FCPTabBarTemplate({
    required this.templates,
    this.title,
  });

  @override
  final FCPTabBarTemplateData templateData;

  /// A title to display in the tab bar.
  final String? title;

  /// A list of templates for the tab bar to display.
  final List<FCPListTemplate> templates;

  /// Updates the templates in the tab bar.
  void updateTemplates({required List<FCPListTemplate> newTemplates}) {
    templates
      ..clear()
      ..addAll(newTemplates);
    // TODO(Redc4ke): Implement a callback of some sort.
  }
}

import 'package:flutter_carplay_plus/src/platform_interface/template/template_messages.g.dart';
import 'package:flutter_carplay_plus/ui/models/templates/fcp_list_template.dart';
import 'package:flutter_carplay_plus/ui/models/templates/fcp_template.dart';

/// A representation of Apple's [CPTabBarTemplate](https://developer.apple.com/documentation/carplay/cptabbartemplate).
/// A template for displaying a set of [FCPListTemplate]s, each with their own tab.
///
/// Can only be used as a root template.
final class FCPTabBarTemplate extends FCPFullscreenTemplate
    with FCPRootTemplate {
  /// Creates a new instance of [FCPTabBarTemplate].
  FCPTabBarTemplate({
    required this.templates,
  }) : super(tabData: null);

  @override
  WrappedTemplateData get serializedData {
    return WrappedTemplateData(
      type: FCPTemplateType.tabBar,
      data: FCPTemplateData(
        componentData: componentData,
      ),
      tabBarTemplateData: FCPTabBarTemplateData(
        templates: templates.map((e) => e.serializedData).toList(),
      ),
    );
  }

  /// A list of templates for the tab bar to display.
  final List<FCPTemplate> templates;
}

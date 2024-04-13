import 'package:flutter_carplay_plus/src/platform_interface/template/template_messages.g.dart';
import 'package:flutter_carplay_plus/ui/models/templates/fcp_template.dart';
import 'package:flutter_carplay_plus/ui/models/templates/list/fcp_list_section.dart';

/// A representation of Apple's [CPListTemplate](https://developer.apple.com/documentation/carplay/cplisttemplate).
/// A template for displaying a list of items, grouped into one or more [FCPListSection]s.
///
/// **IMPORTANT:** Some vehicles may limit the number of items that can be displayed.
/// See [FCPSessionConfiguration] for more.
final class FCPListTemplate extends FCPFullscreenTemplate
    with FCPPushableTemplate {
  /// Creates a new instance of [FCPListTemplate].
  FCPListTemplate({
    required this.sections,
  });

  /// A list of [FCPListSection]s to display in the list.
  final List<FCPListSection> sections;

  @override
  WrappedTemplateData get serializedData {
    return WrappedTemplateData(
      type: FCPTemplateType.list,
      data: FCPTemplateData(
        componentData: componentData,
        category: templateCategory,
      ),
      listTemplateData: FCPListTemplateData(
        sections: sections.map((e) => e.serializedData).toList(),
      ),
    );
  }
}
